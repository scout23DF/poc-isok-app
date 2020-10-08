package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients;

import feign.Response;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCCredentialRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCUserRepresentation;

import java.util.List;

@FeignClient(value = "KeyCloakUserMgmtAPI", url = "http://localhost:9080/auth/admin")
public interface IKeycloakUserMgmtAPIRepository {

    @RequestMapping(method = RequestMethod.POST, value = "/realms/{pRealmName}/users",
                    consumes = MediaType.APPLICATION_JSON_VALUE,
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public Response createUserInKeyCloak(@PathVariable("pRealmName") String pRealmName,
                                         @RequestBody KCUserRepresentation pKCUserToBeCreatedDTO,
                                         @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.GET, value = "/realms/{pRealmName}/users/{pUserIdInKeycloak}",
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public KCUserRepresentation findByIdInKeycloak(@PathVariable("pRealmName") String pRealmName,
                                                   @PathVariable("pUserIdInKeycloak") String pUserIdInKeycloak,
                                                   @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.GET, value = "/realms/{pRealmName}/users",
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public List<KCUserRepresentation> findByUsernameInKeycloak(@PathVariable("pRealmName") String pRealmName,
                                                               @RequestParam("username") String pUsername,
                                                               @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.PUT, value = "/realms/{pRealmName}/users/{pUserIdInKeycloak}/reset-password",
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public Response setupPasswordCredential(@PathVariable("pRealmName") String pRealmName,
                                            @PathVariable("pUserIdInKeycloak") String pUserIdInKeycloak,
                                            @RequestBody KCCredentialRepresentation pKCCredReprDTO,
                                            @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.POST, value = "/realms/{pRealmName}/users/{pUserIdInKeycloak}/logout",
                    produces = MediaType.APPLICATION_JSON_VALUE)
    Response removeAllSessions(@PathVariable("pRealmName") String pRealmName,
                               @PathVariable("pUserIdInKeycloak") String pUserIdInKeycloak,
                               @RequestHeader(name = "Authorization") String pJWTTokenValue);
}
