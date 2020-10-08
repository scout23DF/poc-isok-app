package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients;

import feign.Response;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCRoleRepresentation;

import java.util.List;

@FeignClient(value = "KeyCloakRoleAPI", url = "http://localhost:9080/auth/admin/realms")
public interface IKeycloakRoleAPIRepository {

    @RequestMapping(method = RequestMethod.POST, value = "/{pRealmName}/users/{pTargetUserId}/role-mappings/realm",
                    consumes = MediaType.APPLICATION_JSON_VALUE,
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public Response addRealmRolesToUser(@PathVariable("pRealmName") String pRealmName,
                                        @PathVariable("pTargetUserId") String pTargetUserId,
                                        @RequestBody List<KCRoleRepresentation> pKCRolesReprList,
                                        @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.POST, value = "/{pRealmName}/users/{pTargetUserId}/role-mappings/clients/{pClientName}",
                    consumes = MediaType.APPLICATION_JSON_VALUE,
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public Response addClientRolesToUser(@PathVariable("pRealmName") String pRealmName,
                                        @PathVariable("pTargetUserId") String pTargetUserId,
                                        @PathVariable("pClientName") String pClientName,
                                        @RequestBody List<KCRoleRepresentation> pKCRolesReprList,
                                        @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.PUT, value = "/{pRealmName}/users/{pTargetUserId}/groups/{pGroupId}",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public Response addGroupToUser(@PathVariable("pRealmName") String pRealmName,
                                    @PathVariable("pTargetUserId") String pTargetUserId,
                                    @PathVariable("pGroupId") String pGroupId,
                                    @RequestHeader(name = "Authorization") String pJWTTokenValue);

}
