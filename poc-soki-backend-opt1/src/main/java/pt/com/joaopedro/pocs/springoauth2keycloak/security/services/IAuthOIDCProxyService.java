package pt.com.joaopedro.pocs.springoauth2keycloak.security.services;

import pt.com.joaopedro.pocs.springoauth2keycloak.commons.dtos.AcknowledgeResultDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.AuthenticatedUserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.JWTTokenDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.LoginInfoDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.PermissionTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCGroupRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCRoleRepresentation;

import java.util.List;
import java.util.Optional;

public interface IAuthOIDCProxyService {

    List<KCRoleRepresentation> listAllRolesAvailable(PermissionTypeEnum pPermissionType);
    List<KCGroupRepresentation> listAllRealmGroupsAvailable();
    UserDTO createUser(UserDTO pUserDTO);
    AuthenticatedUserDTO authenticateUser(LoginInfoDTO pLoginInfoDTO);
    JWTTokenDTO refreshAccessToken(String pLoggedUsername, String pRefreshTokenValue);
    AcknowledgeResultDTO resetPassword(LoginInfoDTO pLoginInfoDTO);
    AcknowledgeResultDTO doLogoutUser(String pUsername);
    Optional<UserDTO> searchUserById(String pUserID);
    Optional<UserDTO> searchUserByUsername(String pUsername);
    Optional<UserDTO> searchUserByEmail(String pEmail);

}
