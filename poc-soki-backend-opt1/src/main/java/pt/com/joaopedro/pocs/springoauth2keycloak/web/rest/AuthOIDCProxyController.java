package pt.com.joaopedro.pocs.springoauth2keycloak.web.rest;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.CollectionUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.commons.dtos.AcknowledgeResultDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.commons.exceptions.BadRequestAlertException;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.AuthenticatedUserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.JWTTokenDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.LoginInfoDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.PermissionTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.exceptions.EmailAlreadyUsedException;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.exceptions.LoginAlreadyUsedException;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.IAuthOIDCProxyService;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCGroupRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCRoleRepresentation;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/sso")
@Slf4j
public class AuthOIDCProxyController {

    private IAuthOIDCProxyService authOIDCProxyService;

    @Autowired
    public AuthOIDCProxyController(IAuthOIDCProxyService pIAuthOIDCProxyService) {
        this.authOIDCProxyService = pIAuthOIDCProxyService;
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/public/authorities/realm-roles-available")
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<KCRoleRepresentation>> listAllRealmRoles() {
        List<KCRoleRepresentation> kcRealmRolesFound = null;

        kcRealmRolesFound = authOIDCProxyService.listAllRolesAvailable(PermissionTypeEnum.KEYCLOAK_REALM_ROLE);

        return ResponseEntity.ok(kcRealmRolesFound);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/public/authorities/clientapp-roles-available")
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<KCRoleRepresentation>> listAllClientRoles() {
        List<KCRoleRepresentation> kcRealmRolesFound = null;

        kcRealmRolesFound = authOIDCProxyService.listAllRolesAvailable(PermissionTypeEnum.KEYCLOAK_CLIENT_ROLE);

        return ResponseEntity.ok(kcRealmRolesFound);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/public/authorities/groups-available")
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<KCGroupRepresentation>> listAllRealmGroups() {
        List<KCGroupRepresentation> kcRealmGroupsFound = null;

        kcRealmGroupsFound = authOIDCProxyService.listAllRealmGroupsAvailable();

        return ResponseEntity.ok(kcRealmGroupsFound);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PostMapping("/public/signup")
    @PreAuthorize("permitAll()")
    public ResponseEntity<UserDTO> createUser(@Valid @RequestBody UserDTO pUserDTO) throws URISyntaxException {

        if (pUserDTO.getId() != null) {
            throw new BadRequestAlertException("A new user cannot already have an ID");
            // Lowercase the user login before comparing with database
        } else if (authOIDCProxyService.searchUserByUsername(pUserDTO.getUsername().toLowerCase()).isPresent()) {
            throw new LoginAlreadyUsedException();
        } else if (authOIDCProxyService.searchUserByEmail(pUserDTO.getEmail()).isPresent()) {
            throw new EmailAlreadyUsedException();
        } else {
            UserDTO newUserDTO = authOIDCProxyService.createUser(pUserDTO);

            return ResponseEntity.created(new URI("/api/sso/users/" + newUserDTO.getUsername()))
                                 .body(newUserDTO);
        }
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PostMapping("/public/batch-signup")
    @PreAuthorize("permitAll()")
    public ResponseEntity<List<UserDTO>> createUsers(@Valid @RequestBody List<UserDTO> pUsersDTOList) throws URISyntaxException {
        List<UserDTO> resultList = null;

        if (!CollectionUtils.isEmpty(pUsersDTOList)) {
            resultList = new ArrayList<>(pUsersDTOList.size());

            for (UserDTO oneUserDTO : pUsersDTOList) {
                if (oneUserDTO.getId() != null) {
                    throw new BadRequestAlertException("A new user cannot already have an ID");
                    // Lowercase the user login before comparing with database
                } else if (authOIDCProxyService.searchUserByUsername(oneUserDTO.getUsername().toLowerCase()).isPresent()) {
                    throw new LoginAlreadyUsedException();
                } else if (authOIDCProxyService.searchUserByEmail(oneUserDTO.getEmail()).isPresent()) {
                    throw new EmailAlreadyUsedException();
                } else {
                    UserDTO newUserDTO = authOIDCProxyService.createUser(oneUserDTO);
                    resultList.add(newUserDTO);
                }
            } // for
        }

        return ResponseEntity.created(new URI("/api/sso/users/"))
                             .body(resultList);

    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PostMapping("/public/login")
    @PreAuthorize("permitAll()")
    public ResponseEntity<AuthenticatedUserDTO> authenticateUser(@Valid @RequestBody LoginInfoDTO pLoginInfoDTO) throws URISyntaxException {
        AuthenticatedUserDTO loggedAuthUserDTO = null;

        loggedAuthUserDTO = authOIDCProxyService.authenticateUser(pLoginInfoDTO);

        return ResponseEntity.created(new URI("/api/sso/users/" + loggedAuthUserDTO.getUserDTO().getUsername()))
                             .body(loggedAuthUserDTO);

    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PutMapping("/public/refresh-token/{pLoggedUsername}")
    @PreAuthorize("permitAll()")
    public ResponseEntity<JWTTokenDTO> refreshAccessToken(@NotNull @PathVariable("pLoggedUsername") String pLoggedUsername,
                                                          @RequestHeader(name = "Refresh-Token") String pRefreshTokenValue) {
        JWTTokenDTO jwtTokenDTO = null;

        jwtTokenDTO = authOIDCProxyService.refreshAccessToken(pLoggedUsername, pRefreshTokenValue);

        return ResponseEntity.ok(jwtTokenDTO);

    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PutMapping("/private/reset-password")
    @PreAuthorize("isFullyAuthenticated()")
    public ResponseEntity<AcknowledgeResultDTO> resetUserPassword(@Valid @RequestBody LoginInfoDTO pLoginInfoDTO) {
        AcknowledgeResultDTO ackResult = null;

        ackResult = authOIDCProxyService.resetPassword(pLoginInfoDTO);

        return ResponseEntity.ok(ackResult);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @PostMapping("/private/logout/{pUsername}")
    @PreAuthorize("isFullyAuthenticated()")
    public ResponseEntity<AcknowledgeResultDTO> logoutUser(@NotNull @PathVariable("pUsername") String pUsername) {
        AcknowledgeResultDTO ackResult = null;

        ackResult = authOIDCProxyService.doLogoutUser(pUsername);

        return ResponseEntity.ok(ackResult);
    }

}
