package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak;

import feign.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.config.ConstantsApp;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.enums.MacroAccountTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.SecurityContextUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.IAuthOIDCProxyService;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.mappers.IUserMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakTokenAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakRoleAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakUserMgmtAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCCredentialRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCRoleRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCUserRepresentation;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class KeycloakOIDCProxyServiceImpl implements IAuthOIDCProxyService {

    private IKeycloakTokenAPIRepository iKeycloakTokenAPIRepository;
    private IKeycloakUserMgmtAPIRepository keycloakUserMgmtAPIRepository;
    private IKeycloakRoleAPIRepository keycloakRoleAPIRepository;
    private IUserMapper userMapper;

    @Autowired
    public KeycloakOIDCProxyServiceImpl(IKeycloakTokenAPIRepository pIKeycloakTokenAPIRepository,
                                        IKeycloakUserMgmtAPIRepository pIKeycloakUserMgmtAPIRepository,
                                        IKeycloakRoleAPIRepository pKeycloakRoleAPIRepository, IUserMapper pUserMapper) {
        this.iKeycloakTokenAPIRepository = pIKeycloakTokenAPIRepository;
        this.keycloakUserMgmtAPIRepository = pIKeycloakUserMgmtAPIRepository;
        this.keycloakRoleAPIRepository = pKeycloakRoleAPIRepository;
        this.userMapper = pUserMapper;
    }

    @Override
    public UserDTO createUser(UserDTO pUserDTO) {
        UserDTO newUserDTO = null;
        KCUserRepresentation newKCUserRepr = null;
        Response responseFromKCAPI = null;
        String strSavedUserId = null;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> createUser     :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        newKCUserRepr = userMapper.toRepresentationOIDC(pUserDTO);
        responseFromKCAPI = keycloakUserMgmtAPIRepository.createUserInKeyCloak("PoC-Soki-Realm-01", newKCUserRepr, strOAuth2AccessToken);

        if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.CREATED.value() && responseFromKCAPI.headers() != null && responseFromKCAPI.headers().containsKey("location")) {
            strSavedUserId = responseFromKCAPI.headers().get("location").iterator().next();
            strSavedUserId = strSavedUserId.substring(strSavedUserId.lastIndexOf("/") + 1);

            if (!StringUtils.isEmpty(strSavedUserId)) {

                setupPasswordCredentialInUser(strSavedUserId, pUserDTO.getPassword());

                if (!CollectionUtils.isEmpty(pUserDTO.getRealmRoles())) {
                    addRolesToNewUser(1, "PoC-Soki-Realm-01", null, strSavedUserId, pUserDTO.getRealmRoles());
                }

                if (!CollectionUtils.isEmpty(pUserDTO.getRealmRoles())) { // pUserDTO.getClientRoles())) {
                    addRolesToNewUser(2, "PoC-Soki-Realm-01", "5067ce51-37f0-46a5-bfa2-984543e80361", strSavedUserId, pUserDTO.getRealmRoles());
                    /*
                    String finalStrSavedUserId = strSavedUserId;
                    pUserDTO.getClientRoles().keySet().forEach(
                            oneClientName -> addRolesToNewUser(2,
                                                               "PoC-Soki-Realm-01",
                                                                oneClientName,
                                                                finalStrSavedUserId,
                                                                pUserDTO.getClientRoles().get(oneClientName))
                            );
                    */
                }

                if (!CollectionUtils.isEmpty(pUserDTO.getGroups())) {
                    addRolesToNewUser(3, "PoC-Soki-Realm-01", null, strSavedUserId, pUserDTO.getGroups());
                }

                newUserDTO = this.searchUserById(strSavedUserId).get();
            }
        } else {
            throw new RuntimeException("Error in KeyCloak Admin Client Call: " + responseFromKCAPI.toString());
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

        JWTTokenDTO jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> searchUserById :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        kcUserRepr = keycloakUserMgmtAPIRepository.findByIdInKeycloak("PoC-Soki-Realm-01", pUserID, strOAuth2AccessToken);

        if (kcUserRepr != null) {
            userFoundDTO = userMapper.toDTO(kcUserRepr);
            optFoundUserDTO = Optional.of(userFoundDTO);
        }
        return optFoundUserDTO;
    }

    @Override
    public Optional<UserDTO> searchUserByUsername(String pUsername) {
        Optional<UserDTO> optFoundUserDTO = Optional.empty();
        UserDTO userFoundDTO = null;
        List<KCUserRepresentation> kcUsersReprsList = null;
        String strOAuth2AccessToken = null;

        JWTTokenDTO jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> searchUserByUsername() :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        kcUsersReprsList = keycloakUserMgmtAPIRepository.findByUsernameInKeycloak("PoC-Soki-Realm-01", pUsername, strOAuth2AccessToken);

        if (!CollectionUtils.isEmpty(kcUsersReprsList) && kcUsersReprsList.size() > 0) {
            userFoundDTO = userMapper.toDTO(kcUsersReprsList.get(0));
            optFoundUserDTO = Optional.of(userFoundDTO);
        }
        return optFoundUserDTO;
    }

    @Override
    public Optional<UserDTO> searchUserByEmail(String pEmail) {
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
        AuthenticatedUserDTO authUserDTO = null;

        if (pLoginInfoDTO != null && !StringUtils.isEmpty(pLoginInfoDTO.getUsername()) && !StringUtils.isEmpty(pLoginInfoDTO.getPassword())) {
            pLoginInfoDTO.setMacroAccountTypeEnum(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_REGULAR);
            authUserDTO = getKeyCloakAuthenticatedUser(pLoginInfoDTO);
        }

        return authUserDTO;
    }

    @Override
    public AcknowledgeResultDTO validateJWTToken(JWTTokenDTO pJWTTokenDTO) {
        return null;
    }

    @Override
    public AcknowledgeResultDTO doLogoutUser(AuthenticatedUserDTO pAuthenticatedUserDTO) {
        AcknowledgeResultDTO ackResultDTO = new AcknowledgeResultDTO();
        Response responseFromKCAPI = null;
        String strOAuth2AccessToken = null;

        if (pAuthenticatedUserDTO != null && pAuthenticatedUserDTO.getUserDTO() != null) {
            JWTTokenDTO jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();

            strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
            log.debug("==> searchUserByUsername() :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

            responseFromKCAPI = keycloakUserMgmtAPIRepository.removeAllSessions("PoC-Soki-Realm-01",
                                                                                pAuthenticatedUserDTO.getUserDTO().getId(),
                                                                                strOAuth2AccessToken);

            if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.NO_CONTENT.value()) {
                SecurityContextUtils.getAllCreatedJwttokensMap().remove(pAuthenticatedUserDTO.getUserDTO().getUsername());
                ackResultDTO.setStatusResponse(HttpStatus.OK.toString());
                ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
            } else {
                ackResultDTO.setStatusResponse(HttpStatus.BAD_REQUEST.toString());
                ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
            }
        }

        return ackResultDTO;
    }


    private AuthenticatedUserDTO getKeyCloakAuthenticatedUser(LoginInfoDTO pLoginInfoDTO) {
        AuthenticatedUserDTO authUserDTO = null;
        JWTTokenDTO jwtFromAPI = null;
        JWTTokenDTO refreshedJwtFromAPI = null;
        KeyCloakParamsHolderDTO paramsDTO = null;
        UserDTO userDTO = null;

        if (SecurityContextUtils.getAllCreatedJwttokensMap().containsKey(pLoginInfoDTO.getUsername())) {
            authUserDTO = SecurityContextUtils.getAllCreatedJwttokensMap().get(pLoginInfoDTO.getUsername());
            jwtFromAPI = authUserDTO.getJwtTokenDTO();
            if (jwtFromAPI.isAccessTokenExpired()) {
                paramsDTO = new KeyCloakParamsHolderDTO();
                paramsDTO.setGrantType("refresh_token");
                paramsDTO.setRefreshToken(jwtFromAPI.getRefreshToken());
                paramsDTO.setRefreshToken(jwtFromAPI.getRefreshToken());

                if (pLoginInfoDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
                    paramsDTO.setClientId("admin-cli");
                    paramsDTO.setClientSecret("");
                    refreshedJwtFromAPI = iKeycloakTokenAPIRepository.getAdminJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapToRefreshToken());
                } else {
                    paramsDTO.setClientId("PoC-Soki-App-Client-01");
                    refreshedJwtFromAPI = iKeycloakTokenAPIRepository.getUserJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapToRefreshToken());
                }
                if (refreshedJwtFromAPI != null) {
                    jwtFromAPI = refreshedJwtFromAPI;
                    jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
                    jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
                    authUserDTO.setJwtTokenDTO(jwtFromAPI);
                }
            }
        } else {
            paramsDTO = new KeyCloakParamsHolderDTO();
            paramsDTO.setGrantType("password");
            paramsDTO.setUsername(pLoginInfoDTO.getUsername());
            paramsDTO.setPassword(pLoginInfoDTO.getPassword());
            if (pLoginInfoDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
                paramsDTO.setClientId("admin-cli");
                jwtFromAPI = iKeycloakTokenAPIRepository.getAdminJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapForFirstLogin());
            } else {
                paramsDTO.setClientId("PoC-Soki-App-Client-01");
                paramsDTO.setClientSecret("d90508dd-916f-4215-824b-6cd29f8ec49f");
                paramsDTO.setScope("openid");
                jwtFromAPI = iKeycloakTokenAPIRepository.getUserJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapForRegularUserLogin());
            }

            if (jwtFromAPI != null) {
                jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
                jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
                if (pLoginInfoDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
                    userDTO = new UserDTO();
                    userDTO.setUsername("manager01.from.app.proxy");
                    authUserDTO = new AuthenticatedUserDTO(jwtFromAPI, userDTO, MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN);
                } else {
                    userDTO = this.searchUserByUsername(pLoginInfoDTO.getUsername()).get();
                    authUserDTO = new AuthenticatedUserDTO(jwtFromAPI, userDTO, MacroAccountTypeEnum.USER_ACCOUNT_TYPE_REGULAR);
                }
            }

        }

        if (jwtFromAPI != null) {
            SecurityContextUtils.getAllCreatedJwttokensMap().put(pLoginInfoDTO.getUsername().toLowerCase(), authUserDTO);
        }

        return authUserDTO;
    }


    private void setupPasswordCredentialInUser(String pUserId, String pPasswordValue) {
        Response responseFromKCAPI = null;
        KCCredentialRepresentation kcCredentialReprTmp = null;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        kcCredentialReprTmp = new KCCredentialRepresentation(KCCredentialRepresentation.PASSWORD, pPasswordValue);

        responseFromKCAPI = keycloakUserMgmtAPIRepository.setupPasswordCredential("PoC-Soki-Realm-01",
                                                                                    pUserId,
                                                                                    kcCredentialReprTmp,
                                                                                    strOAuth2AccessToken);

    }

    private void addRolesToNewUser(Integer pRoleType, String pRealmName, String pClientName, String pTargetUserId, List<String> pRolesNamesList) {
        Response responseFromKCAPI = null;
        KCRoleRepresentation oneKCRoleReprTmp = null;
        List<KCRoleRepresentation> kcRolesReprsList = new ArrayList<>(pRolesNamesList.size());
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin()).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        // kcRolesReprsList = convertRolesStringToRoleRepresentationsList(pRoleType, pUserDTO.getRealmRoles());
        // pRealmRolesNamesList.forEach(oneRoleName -> kcRolesReprsList.add(new KCRoleRepresentation(oneRoleName, false)));

        if (pRoleType == 1) { // Realm Role
            kcRolesReprsList.add(new KCRoleRepresentation("ce444fac-89c9-429f-a904-acdbd94b9883", "ADMIN_REALM_ROLE", false));
            kcRolesReprsList.add(new KCRoleRepresentation("13340cb1-3c75-4490-9ab8-ddbb80b8735d", "OPERATOR_REALM_ROLE", false));
            kcRolesReprsList.add(new KCRoleRepresentation("c17d0171-469d-4d1b-8cb3-bca5ac389f92", "BASIC_REGISTERED_REALM_ROLE", false));

            responseFromKCAPI = keycloakRoleAPIRepository.addRealmRolesToUser(pRealmName,
                                                                                pTargetUserId,
                                                                                kcRolesReprsList,
                                                                                strOAuth2AccessToken);

        } else if (pRoleType == 2) { // Client Role
            kcRolesReprsList.add(new KCRoleRepresentation("98465380-81bb-4389-9f63-0da7896642bd", "ADMIN_CLIENT_ROLE", true));
            kcRolesReprsList.add(new KCRoleRepresentation("e93a1a43-7a5c-4187-8f0b-77d8a275b9cd", "OPERATOR_CLIENT_ROLE", true));
            kcRolesReprsList.add(new KCRoleRepresentation("8fb0e3e3-fe73-48b1-8ed3-b52455c0406b", "BASIC_REGISTERED_CLIENT_ROLE", true));

            responseFromKCAPI = keycloakRoleAPIRepository.addClientRolesToUser(pRealmName,
                                                                                pTargetUserId,
                                                                                pClientName,
                                                                                kcRolesReprsList,
                                                                                strOAuth2AccessToken);
        } else if (pRoleType == 3) { // Groups
            String[] groupsIdsArray = {"c2c30d34-ae5d-409e-a444-0a59ac7ccfe4", "", "9e7488ea-1729-42d9-a561-304bdd2c17b5", "9a2babf8-82a0-4031-b0e5-18276d5c69c6"};

            for (String oneGroupId : groupsIdsArray) {
                responseFromKCAPI = keycloakRoleAPIRepository.addGroupToUser(pRealmName,
                                                                            pTargetUserId,
                                                                            oneGroupId,
                                                                            strOAuth2AccessToken);
            }

        }

    }

}
