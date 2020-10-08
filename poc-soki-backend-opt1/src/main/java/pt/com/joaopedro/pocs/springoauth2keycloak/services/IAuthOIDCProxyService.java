package pt.com.joaopedro.pocs.springoauth2keycloak.services;

import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.*;

import java.util.List;
import java.util.Optional;

public interface IAuthOIDCProxyService {

    public UserDTO createUser(UserDTO pUserDTO);
    public UserDTO updateUser(UserDTO pUserDTO);
    public AcknowledgeResultDTO deleteUser(String pLogin);
    public Optional<UserDTO> searchUserById(String pUserID);
    public Optional<UserDTO> searchUserByUsername(String pUsername);
    public Optional<UserDTO> searchUserByEmail(String pEmail);
    public List<UserDTO> getAllUsers();
    public List<String> getRolesCurrentLoggedUser();
    public AuthenticatedUserDTO authenticateUser(LoginInfoDTO pLoginInfoDTO);
    public AcknowledgeResultDTO validateJWTToken(JWTTokenDTO pJWTTokenDTO);
    public AcknowledgeResultDTO doLogoutUser(AuthenticatedUserDTO pAuthenticatedUserDTO);

}
