package pt.com.joaopedro.pocs.springoauth2keycloak.repositories.feignclients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.JWTTokenDTO;

@FeignClient(value = "KeyCloakAdminAPI", url = "http://localhost:9080/auth/realms/master/protocol/openid-connect")
public interface IKeycloakAdminAPIRepository {

    @RequestMapping(method = RequestMethod.POST, value = "/token",
                    consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
                    produces = "application/json")
    public JWTTokenDTO getMasterAdminJWTToken(MultiValueMap<String, String> pParamDTO);

}
