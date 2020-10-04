package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Data
@AllArgsConstructor
public class KeyCloakParamsHolderDTO {

    private String username;
    private String password;
    private String grantType;
    private String clientId;

    public MultiValueMap<String, String> getAsMultiValueMap() {
        MultiValueMap<String, String> resultParamsDTO = new LinkedMultiValueMap<>();
        resultParamsDTO.add("username", getUsername());
        resultParamsDTO.add("password", getPassword());
        resultParamsDTO.add("grant_type", getGrantType());
        resultParamsDTO.add("client_id", getClientId());

        return resultParamsDTO;
    }
}
