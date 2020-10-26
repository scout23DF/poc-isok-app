package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.JWTTokenDTO;

@FeignClient(value = "KeyCloakAdminAPI", url = "${feign.client.url.keycloak-host-url}/auth")
public interface IKeycloakTokenAPIRepository {

    @RequestMapping(method = RequestMethod.POST, value = "/realms/master/protocol/openid-connect/token",
                    consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
                    produces = "application/json")
    public JWTTokenDTO getAdminJWTTokenFromKeyCloakAPI(MultiValueMap<String, String> pParamDTO);

    @RequestMapping(method = RequestMethod.POST, value = "/realms/PoC-Soki-Realm-01/protocol/openid-connect/token",
                    consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE,
                    produces = "application/json")
    public JWTTokenDTO getUserJWTTokenFromKeyCloakAPI(MultiValueMap<String, String> pParamDTO);
/*
    curl -L -X POST 'http://localhost:8080/auth/realms/whatever-realm/protocol/openid-connect/token' \
    -H 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=clientid-03' \
    --data-urlencode 'grant_type=password' \
    --data-urlencode 'client_secret=ec78c6bb-8339-4bed-9b1b-e973d27107dc' \
    --data-urlencode 'scope=openid' \
    --data-urlencode 'username=emuhamma' \
    --data-urlencode 'password=1'
    */
}
