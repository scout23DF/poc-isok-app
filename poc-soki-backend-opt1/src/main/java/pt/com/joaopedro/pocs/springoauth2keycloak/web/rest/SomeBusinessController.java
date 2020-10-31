package pt.com.joaopedro.pocs.springoauth2keycloak.web.rest;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pt.com.joaopedro.pocs.springoauth2keycloak.business.models.Country;
import pt.com.joaopedro.pocs.springoauth2keycloak.business.services.ISomeBusinessService;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.ConstantsApp;

import java.util.List;

@RestController
@RequestMapping("/api/business")
@Slf4j
public class SomeBusinessController {

    private ISomeBusinessService someBusinessService;

    @Autowired
    public SomeBusinessController(ISomeBusinessService pISomeBusinessService) {
        this.someBusinessService = pISomeBusinessService;
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/countries/public")
    @PreAuthorize("hasAnyAuthority('ROLE_ANONYMOUS')")
    public ResponseEntity<List<Country>> listAllCountries00() {
        List<Country> resultList = null;

        resultList = someBusinessService.searchCountries();

        return ResponseEntity.ok(resultList);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/countries/req-role-basic")
    @PreAuthorize("hasAnyAuthority(\"" + ConstantsApp.DEFAULT_PREFIX_ROLES_NAMES + "05_BASIC_EMPLOYEES_CLIENT_ROLE\")")
    public ResponseEntity<List<Country>> listAllCountries01() {
        List<Country> resultList = null;

        resultList = someBusinessService.searchCountries();

        return ResponseEntity.ok(resultList);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/countries/req-role-operator")
    @PreAuthorize("hasAnyAuthority(\"" + ConstantsApp.DEFAULT_PREFIX_ROLES_NAMES + "04_OPERATORS_CLIENT_ROLE\")")
    public ResponseEntity<List<Country>> listAllCountries02() {
        List<Country> resultList = null;

        resultList = someBusinessService.searchCountries();

        return ResponseEntity.ok(resultList);
    }

    @ApiOperation(value = "", authorizations = { @Authorization(value="apiKey") })
    @GetMapping("/countries/req-role-admin")
    @PreAuthorize("hasAnyAuthority(\"" + ConstantsApp.DEFAULT_PREFIX_ROLES_NAMES + "01_CHIEFS_CLIENT_ROLE\")")
    public ResponseEntity<List<Country>> listAllCountries03() {
        List<Country> resultList = null;

        resultList = someBusinessService.searchCountries();

        return ResponseEntity.ok(resultList);
    }

}
