package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak;

import feign.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.repositories.feignclients.IKeycloakAdminAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.repositories.feignclients.IKeycloakUserMgmtAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.IAuthOIDCProxyService;

import java.util.List;
import java.util.Optional;

@Service
public class KeycloakOIDCProxyImpl implements IAuthOIDCProxyService {

    private IKeycloakAdminAPIRepository iKeycloakAdminAPIRepository;
    private IKeycloakUserMgmtAPIRepository iKeycloakUserMgmtAPIRepository;

    @Autowired
    public KeycloakOIDCProxyImpl(IKeycloakAdminAPIRepository pIKeycloakAdminAPIRepository,
                                 IKeycloakUserMgmtAPIRepository pIKeycloakUserMgmtAPIRepository) {
        this.iKeycloakAdminAPIRepository = pIKeycloakAdminAPIRepository;
        this.iKeycloakUserMgmtAPIRepository = pIKeycloakUserMgmtAPIRepository;
    }

    @Override
    public UserDTO createUser(UserDTO pUserDTO) {
        UserDTO newUserDTO = null;
        Optional<JWTTokenDTO> optKcAdminJWTTokenDTO = null;
        Response responseFromKCAPI = null;
        String strSavedUserId = null;

        optKcAdminJWTTokenDTO = getKeyCloakAdminJWTToken();

        if (optKcAdminJWTTokenDTO.isPresent()) {
            responseFromKCAPI = iKeycloakUserMgmtAPIRepository.createUserInKeyCloak(pUserDTO, "bearer " + optKcAdminJWTTokenDTO.get().getAccessToken());

            if (responseFromKCAPI != null && responseFromKCAPI.headers() != null && responseFromKCAPI.headers().containsKey("location")) {
                strSavedUserId = responseFromKCAPI.headers().get("location").iterator().next();
                strSavedUserId = strSavedUserId.substring(strSavedUserId.lastIndexOf("/") + 1);

                if (!StringUtils.isEmpty(strSavedUserId)) {
                    newUserDTO = this.searchUserById(strSavedUserId, "bearer " + optKcAdminJWTTokenDTO.get().getAccessToken()).get();
                }
            }
        }

        return newUserDTO;
    }

    @Override
    public UserDTO updateUser(UserDTO pUserDTO) {
        return null;
    }

    @Override
    public AcknowledgeResultDTO deleteUser(String pLogin) {
        return null;
    }

    @Override
    public Optional<UserDTO> searchUserById(String pUserID, String pJWTAdminToken) {
        Optional<UserDTO> optFoundUserDTO = Optional.empty();
        UserDTO userFoundDTO = null;

        userFoundDTO = iKeycloakUserMgmtAPIRepository.findByIdInKeycloak(pUserID, pJWTAdminToken);

        if (userFoundDTO != null) {
            optFoundUserDTO = Optional.of(userFoundDTO);
        }
        return optFoundUserDTO;
    }

    @Override
    public Optional<UserDTO> searchUserByUsername(String pUsername) {
        return Optional.empty();
    }

    @Override
    public Optional<UserDTO> searchUserByLoginIgnoreCase(String pEmail) {
        return Optional.empty();
    }

    @Override
    public List<UserDTO> getAllUsers() {
        return null;
    }

    @Override
    public List<String> getRolesCurrentLoggedUser() {
        return null;
    }

    @Override
    public AuthenticatedUserDTO authenticateUser(LoginInfoDTO pLoginInfoDTO) {
        return null;
    }

    @Override
    public AcknowledgeResultDTO validateJWTToken(JWTTokenDTO pJWTTokenDTO) {
        return null;
    }

    @Override
    public AcknowledgeResultDTO doLogoutUser(AuthenticatedUserDTO pAuthenticatedUserDTO) {
        return null;
    }


    private Optional<JWTTokenDTO> getKeyCloakAdminJWTToken() {
        Optional<JWTTokenDTO> optResult = Optional.empty();
        JWTTokenDTO jwtFromAPI = null;
        KeyCloakParamsHolderDTO paramsDTO = new KeyCloakParamsHolderDTO("manager01.from.app.proxy", "1a88a1", "password", "admin-cli");
        jwtFromAPI = iKeycloakAdminAPIRepository.getMasterAdminJWTToken(paramsDTO.getAsMultiValueMap());

        if (jwtFromAPI != null) {
            optResult = Optional.of(jwtFromAPI);
        }
        return optResult;
    }

}
