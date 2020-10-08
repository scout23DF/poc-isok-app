package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.enums.MacroAccountTypeEnum;

@Data
@AllArgsConstructor
public class AuthenticatedUserDTO {

    private JWTTokenDTO jwtTokenDTO;
    private UserDTO userDTO;
    private MacroAccountTypeEnum macroAccountTypeEnum;

}
