package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.ConstantsApp;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.enums.MacroAccountTypeEnum;

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


    public static LoginInfoDTO buildInternalKCAdminLogin() {
        return new LoginInfoDTO(ConstantsApp.NOM_KEYCLOAK_ADMIN_USERNAME,
                                ConstantsApp.NOM_KEYCLOAK_ADMIN_PASSWORD,
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
