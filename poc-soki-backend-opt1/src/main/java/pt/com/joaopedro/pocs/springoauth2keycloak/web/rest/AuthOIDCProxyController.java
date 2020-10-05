package pt.com.joaopedro.pocs.springoauth2keycloak.web.rest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.ConstantsApp;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.SecurityContextUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.SecurityProperties;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.exceptions.BadRequestAlertException;
import pt.com.joaopedro.pocs.springoauth2keycloak.exceptions.EmailAlreadyUsedException;
import pt.com.joaopedro.pocs.springoauth2keycloak.exceptions.LoginAlreadyUsedException;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.IAuthOIDCProxyService;

import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Set;

@RestController
@RequestMapping("/api/sso")
@Slf4j
public class AuthOIDCProxyController {

    private IAuthOIDCProxyService authOIDCProxyService;

    @Autowired
    public AuthOIDCProxyController(IAuthOIDCProxyService pIAuthOIDCProxyService) {
        this.authOIDCProxyService = pIAuthOIDCProxyService;
    }

    @PostMapping("/public/register")
    @PreAuthorize("hasAnyAuthority('ROLE_ANONYMOUS')")
    public ResponseEntity<UserDTO> createUser(@Valid @RequestBody UserDTO pUserDTO) throws URISyntaxException {

        if (pUserDTO.getId() != null) {
            throw new BadRequestAlertException("A new user cannot already have an ID");
            // Lowercase the user login before comparing with database
        } else if (authOIDCProxyService.searchUserByUsername(pUserDTO.getUsername().toLowerCase()).isPresent()) {
            throw new LoginAlreadyUsedException();
        } else if (authOIDCProxyService.searchUserByLoginIgnoreCase(pUserDTO.getEmail()).isPresent()) {
            throw new EmailAlreadyUsedException();
        } else {
            UserDTO newUserDTO = authOIDCProxyService.createUser(pUserDTO);

            return ResponseEntity.created(new URI("/api/sso/users/" + newUserDTO.getUsername()))
                                 .body(newUserDTO);
        }
    }

    @GetMapping(path = "/private/username")
    @PreAuthorize("hasAnyAuthority(\"" + ConstantsApp.DEFAULT_PREFIX_ROLES_NAMES + "BASIC_REGISTERED_CLIENT_ROLE\")")
    public ResponseEntity<String> getAuthorizedUserName() {
        return ResponseEntity.ok(SecurityContextUtils.getUserName());
    }

    @GetMapping(path = "/private/roles")
    @PreAuthorize("hasAnyAuthority(\"" + ConstantsApp.DEFAULT_PREFIX_ROLES_NAMES + "BASIC_REGISTERED_CLIENT_ROLE\")")
    public ResponseEntity<Set<String>> getAuthorizedUserRoles() {
        return ResponseEntity.ok(SecurityContextUtils.getUserRoles());
    }
}
