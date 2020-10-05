package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak;

import feign.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.ConstantsApp;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.SecurityContextUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.IAuthOIDCProxyService;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.mappers.IUserMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakAdminAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakUserMgmtAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCUserRepresentation;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class KeycloakOIDCProxyServiceImpl implements IAuthOIDCProxyService {

    private IKeycloakAdminAPIRepository keycloakAdminAPIRepository;
    private IKeycloakUserMgmtAPIRepository keycloakUserMgmtAPIRepository;
    private IUserMapper userMapper;

    @Autowired
    public KeycloakOIDCProxyServiceImpl(IKeycloakAdminAPIRepository pIKeycloakAdminAPIRepository,
                                        IKeycloakUserMgmtAPIRepository pIKeycloakUserMgmtAPIRepository,
                                        IUserMapper pUserMapper) {
        this.keycloakAdminAPIRepository = pIKeycloakAdminAPIRepository;
        this.keycloakUserMgmtAPIRepository = pIKeycloakUserMgmtAPIRepository;
        this.userMapper = pUserMapper;
    }

    @Override
    public UserDTO createUser(UserDTO pUserDTO) {
        UserDTO newUserDTO = null;
        KCUserRepresentation newKCUserRepr = null;
        Response responseFromKCAPI = null;
        String strSavedUserId = null;

        newKCUserRepr = userMapper.toRepresentationOIDC(pUserDTO);

        String strOAuth2AccessToken = null;

        JWTTokenDTO jwkTmp = getKeyCloakAdminJWTToken();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        System.out.println("==> createUser     :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);
        responseFromKCAPI = keycloakUserMgmtAPIRepository.createUserInKeyCloak(newKCUserRepr, strOAuth2AccessToken);

        if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.CREATED.value() && responseFromKCAPI.headers() != null && responseFromKCAPI.headers().containsKey("location")) {
            strSavedUserId = responseFromKCAPI.headers().get("location").iterator().next();
            strSavedUserId = strSavedUserId.substring(strSavedUserId.lastIndexOf("/") + 1);

            if (!StringUtils.isEmpty(strSavedUserId)) {
                newUserDTO = this.searchUserById(strSavedUserId).get();
            }
        } else {
            throw new RuntimeException("Error in KeyCloak Admin Cliente Call: " + responseFromKCAPI.toString());
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
    public Optional<UserDTO> searchUserById(String pUserID) {
        Optional<UserDTO> optFoundUserDTO = Optional.empty();
        UserDTO userFoundDTO = null;
        KCUserRepresentation kcUserRepr = null;
        String strOAuth2AccessToken = null;

        JWTTokenDTO jwkTmp = getKeyCloakAdminJWTToken();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        System.out.println("==> searchUserById :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        kcUserRepr = keycloakUserMgmtAPIRepository.findByIdInKeycloak(pUserID, strOAuth2AccessToken);

        if (kcUserRepr != null) {
            userFoundDTO = userMapper.toDTO(kcUserRepr);
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


    private JWTTokenDTO getKeyCloakAdminJWTToken() {
        JWTTokenDTO jwtFromAPI = null;
        JWTTokenDTO refreshedJwtFromAPI = null;
        KeyCloakParamsHolderDTO paramsDTO = null;

        if (SecurityContextUtils.getAllCreatedJwttokensMap().containsKey(ConstantsApp.NOM_ADMIN_USERNAME_KEY)) {
            jwtFromAPI = SecurityContextUtils.getAllCreatedJwttokensMap().get(ConstantsApp.NOM_ADMIN_USERNAME_KEY);
            if (jwtFromAPI.isAccessTokenExpired()) {
                paramsDTO = new KeyCloakParamsHolderDTO();
                paramsDTO.setGrantType("refresh_token");
                paramsDTO.setClientId("admin-cli");
                paramsDTO.setClientSecret("");
                paramsDTO.setRefreshToken(jwtFromAPI.getRefreshToken());
                refreshedJwtFromAPI = keycloakAdminAPIRepository.getMasterAdminJWTToken(paramsDTO.getAsMultiValueMapToRefreshToken());
                if (refreshedJwtFromAPI != null) {
                    jwtFromAPI = refreshedJwtFromAPI; // .setAccessToken(refreshedJwtFromAPI.getAccessToken());
                    jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
                    jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
                    SecurityContextUtils.getAllCreatedJwttokensMap().put(ConstantsApp.NOM_ADMIN_USERNAME_KEY, jwtFromAPI);
                }
            }
        } else {
            paramsDTO = new KeyCloakParamsHolderDTO();
            paramsDTO.setGrantType("password");
            paramsDTO.setClientId("admin-cli");
            paramsDTO.setUsername("manager01.from.app.proxy");
            paramsDTO.setPassword("1a88a1");
            jwtFromAPI = keycloakAdminAPIRepository.getMasterAdminJWTToken(paramsDTO.getAsMultiValueMapForFirstLogin());
            jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
            jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
            SecurityContextUtils.getAllCreatedJwttokensMap().put(ConstantsApp.NOM_ADMIN_USERNAME_KEY, jwtFromAPI);
        }

        return jwtFromAPI;
    }

}
