package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Data
@NoArgsConstructor
public class KeyCloakParamsHolderDTO {

    private String username;
    private String password;
    private String grantType;
    private String clientId;
    private String clientSecret;
    private String refreshToken;


    public MultiValueMap<String, String> getAsMultiValueMapForFirstLogin() {
        MultiValueMap<String, String> resultParamsDTO = new LinkedMultiValueMap<>();
        resultParamsDTO.add("username", getUsername());
        resultParamsDTO.add("password", getPassword());
        resultParamsDTO.add("grant_type", getGrantType());
        resultParamsDTO.add("client_id", getClientId());

        return resultParamsDTO;
    }

    public MultiValueMap<String, String> getAsMultiValueMapToRefreshToken() {
        MultiValueMap<String, String> resultParamsDTO = new LinkedMultiValueMap<>();
        resultParamsDTO.add("client_secret", getClientSecret());
        resultParamsDTO.add("refresh_token", getRefreshToken());
        resultParamsDTO.add("grant_type", getGrantType());
        resultParamsDTO.add("client_id", getClientId());

        return resultParamsDTO;
    }

}
