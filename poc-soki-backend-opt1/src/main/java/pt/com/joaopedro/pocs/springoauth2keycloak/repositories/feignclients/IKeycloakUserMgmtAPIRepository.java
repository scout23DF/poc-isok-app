package pt.com.joaopedro.pocs.springoauth2keycloak.repositories.feignclients;

import feign.Response;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.UserDTO;

@FeignClient(value = "KeyCloakUserMgmtAPI", url = "http://localhost:9080/auth/admin/realms/PoC-Soki-Realm-01")
public interface IKeycloakUserMgmtAPIRepository {

    @RequestMapping(method = RequestMethod.POST, value = "/users",
                    consumes = MediaType.APPLICATION_JSON_VALUE,
                    produces = MediaType.APPLICATION_JSON_VALUE)
    public Response createUserInKeyCloak(UserDTO pUserToBeCreatedDTO,
                                         @RequestHeader(name = "Authorization") String pJWTTokenValue);

    @RequestMapping(method = RequestMethod.GET, value = "/users/{pUserIdInKeycloak}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public UserDTO findByIdInKeycloak(@PathVariable("pUserIdInKeycloak") String pUserIdInKeycloak,
                                      @RequestHeader(name = "Authorization") String pJWTTokenValue);

}