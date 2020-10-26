package pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.MacroAccountTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.AppSecurityProperties;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * View Model object for storing a user's credentials.
 */
@Data
@NoArgsConstructor
@RequiredArgsConstructor
@ToString(exclude = "password")
public class LoginInfoDTO {

    @NotNull
    @NonNull
    @Size(min = 1, max = 50)
    private String username;

    @NotNull
    @NonNull
    @Size(min = 4, max = 100)
    private String password;

    private Boolean rememberMe = false;

    @NonNull
    @JsonIgnore
    private MacroAccountTypeEnum macroAccountTypeEnum;


    public static LoginInfoDTO buildInternalKCAdminLogin(AppSecurityProperties pAppSecProps) {
        return new LoginInfoDTO(pAppSecProps.getAdminKeycloakSystemAccountUsername(),
                                pAppSecProps.getAdminKeycloakSystemAccountPassword(),
                                MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN);
    }

    // prettier-ignore
    @Override
    public String toString() {
        return "LoginVM{" +
            "username='" + username + '\'' +
            ", rememberMe=" + rememberMe +
            '}';
    }
}
