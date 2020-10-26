package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.helpers;

import feign.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.MacroAccountTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.PermissionTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.mappers.IUserMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakRoleAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakTokenAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakUserMgmtAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.*;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.AppSecurityProperties;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.SecurityContextUtils;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Component
@Slf4j
public class AuthenticatedUserDetailsHelper {

    private IKeycloakTokenAPIRepository iKeycloakTokenAPIRepository;
    private IKeycloakUserMgmtAPIRepository keycloakUserMgmtAPIRepository;
    private IKeycloakRoleAPIRepository keycloakRoleAPIRepository;
    private IUserMapper userMapper;
    private AppSecurityProperties appSecurityProperties;


    @Autowired
    public AuthenticatedUserDetailsHelper(IKeycloakTokenAPIRepository pIKeycloakTokenAPIRepository,
                                          IKeycloakUserMgmtAPIRepository pIKeycloakUserMgmtAPIRepository,
                                          IKeycloakRoleAPIRepository pKeycloakRoleAPIRepository,
                                          IUserMapper pUserMapper,
                                          AppSecurityProperties pAppSecurityProperties) {

        this.iKeycloakTokenAPIRepository = pIKeycloakTokenAPIRepository;
        this.keycloakUserMgmtAPIRepository = pIKeycloakUserMgmtAPIRepository;
        this.keycloakRoleAPIRepository = pKeycloakRoleAPIRepository;
        this.userMapper = pUserMapper;
        this.appSecurityProperties = pAppSecurityProperties;
    }


    public AuthenticatedUserDTO getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO pLoginInfoDTO) {
        AuthenticatedUserDTO authUserDTO = null;

        if (!SecurityContextUtils.getAllCreatedJWTTokensMap().containsKey(pLoginInfoDTO.getUsername())) {

            authUserDTO = authenticateUserOnKeycloak(pLoginInfoDTO);

        } else {

            authUserDTO = refreshTokenAndUpdateAuthUser(pLoginInfoDTO.getUsername(), Boolean.FALSE, null);

        }

        SecurityContextUtils.getAllCreatedJWTTokensMap().put(pLoginInfoDTO.getUsername().toLowerCase(), authUserDTO);

        return authUserDTO;
    }

    public Optional<UserDTO> searchUserByUsername(String pUsername) {
        Optional<UserDTO> optFoundUserDTO = Optional.empty();
        UserDTO userFoundDTO = null;
        List<KCUserRepresentation> kcUsersReprsList = null;
        String strOAuth2AccessToken = null;

        JWTTokenDTO jwkTmp = this.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> searchUserByUsername() :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        kcUsersReprsList = keycloakUserMgmtAPIRepository.findByUsernameInKeycloak(appSecurityProperties.getTargetKeycloakRealmName(), pUsername, strOAuth2AccessToken);

        if (!CollectionUtils.isEmpty(kcUsersReprsList) && kcUsersReprsList.size() > 0) {
            userFoundDTO = userMapper.toDTO(kcUsersReprsList.get(0));
            findAndDecorateWithPermissionsAssigned(userFoundDTO);
            optFoundUserDTO = Optional.of(userFoundDTO);
        }
        return optFoundUserDTO;
    }

    public Optional<UserDTO> searchUserById(String pUserID) {
        Optional<UserDTO> optFoundUserDTO = Optional.empty();
        UserDTO userFoundDTO = null;
        KCUserRepresentation kcUserRepr = null;
        String strOAuth2AccessToken = null;

        JWTTokenDTO jwkTmp = this.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> searchUserById :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        kcUserRepr = keycloakUserMgmtAPIRepository.findByIdInKeycloak(appSecurityProperties.getTargetKeycloakRealmName(), pUserID, strOAuth2AccessToken);

        if (kcUserRepr != null) {
            userFoundDTO = userMapper.toDTO(kcUserRepr);
            findAndDecorateWithPermissionsAssigned(userFoundDTO);
            optFoundUserDTO = Optional.of(userFoundDTO);
        }
        return optFoundUserDTO;
    }

    public Response setupPasswordCredentialInUser(String pUserId, String pPasswordValue) {
        Response responseFromKCAPI = null;
        KCCredentialRepresentation kcCredentialReprTmp = null;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        kcCredentialReprTmp = new KCCredentialRepresentation(KCCredentialRepresentation.PASSWORD, pPasswordValue);

        responseFromKCAPI = keycloakUserMgmtAPIRepository.setupPasswordCredential(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                                    pUserId,
                                                                                    kcCredentialReprTmp,
                                                                                    strOAuth2AccessToken);

        return responseFromKCAPI;
    }

    public void addRolesToNewUser(PermissionTypeEnum pPermissionType, String pRealmName, String pClientRealId, String pTargetUserId, List<String> pRolesOrGroupsNamesList) {
        Response responseFromKCAPI = null;
        KCRoleRepresentation oneKCRoleReprTmp = null;
        List<KCRoleRepresentation> kcRolesReprsList;
        List<KCGroupRepresentation> kcGroupsReprsList;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        switch (pPermissionType) {
            case KEYCLOAK_REALM_ROLE : // Realm Role

                kcRolesReprsList = keycloakRoleAPIRepository.findAllRealmRoles(pRealmName, strOAuth2AccessToken);
                kcRolesReprsList = kcRolesReprsList.stream()
                                                   .filter(oneKCRole -> pRolesOrGroupsNamesList.contains(oneKCRole.getName()))
                                                   .collect(Collectors.toList());

                responseFromKCAPI = keycloakRoleAPIRepository.addRealmRolesToUser(pRealmName,
                                                                                  pTargetUserId,
                                                                                  kcRolesReprsList,
                                                                                  strOAuth2AccessToken);

                break;

            case KEYCLOAK_CLIENT_ROLE : // Client Role

                kcRolesReprsList = keycloakRoleAPIRepository.findAllClientRoles(pRealmName, pClientRealId, strOAuth2AccessToken);
                kcRolesReprsList = kcRolesReprsList.stream()
                                                   .filter(oneKCRole -> pRolesOrGroupsNamesList.contains(oneKCRole.getName()))
                                                   .collect(Collectors.toList());

                responseFromKCAPI = keycloakRoleAPIRepository.addClientRolesToUser(pRealmName,
                                                                                    pTargetUserId,
                                                                                    pClientRealId,
                                                                                    kcRolesReprsList,
                                                                                    strOAuth2AccessToken);

                break;

            default : // (PermissionTypeEnum.KEYCLOAK_CLIENT_ROLE)) { // Groups

                kcGroupsReprsList = keycloakRoleAPIRepository.findAllRealmGroups(pRealmName, strOAuth2AccessToken);
                kcGroupsReprsList = kcGroupsReprsList.stream()
                                                     .filter(oneKCRole -> pRolesOrGroupsNamesList.contains(oneKCRole.getName()))
                                                     .collect(Collectors.toList());

                if (!CollectionUtils.isEmpty(kcGroupsReprsList)) {

                    for (KCGroupRepresentation oneGroupRep : kcGroupsReprsList) {

                        responseFromKCAPI = keycloakRoleAPIRepository.addGroupToUser(pRealmName,
                                                                                    pTargetUserId,
                                                                                    oneGroupRep.getId(),
                                                                                    strOAuth2AccessToken);

                    }
                }
                break;
        }

    }

    private void findAndDecorateWithPermissionsAssigned(UserDTO pUserToDecorateDTO) {
        KCMappingsRepresentation kcMappingsRepr = null;
        List<KCRoleRepresentation> kcRoleReprList = null;
        List<KCGroupRepresentation> kcGroupReprList = null;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        kcMappingsRepr = keycloakUserMgmtAPIRepository.getAllMappedRolesAssignedToUser(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                                        pUserToDecorateDTO.getId(),
                                                                                        strOAuth2AccessToken);

        if (kcMappingsRepr != null) {
            if (!CollectionUtils.isEmpty(kcMappingsRepr.getRealmMappings())) {
                pUserToDecorateDTO.setRealmRoles(kcMappingsRepr.getRealmMappings().stream().map(KCRoleRepresentation::getName).collect(Collectors.toList()));
            }

            if (kcMappingsRepr.getClientMappings() != null && kcMappingsRepr.getClientMappings().containsKey(appSecurityProperties.getTargetKeycloakClientFriendlyId())) {
                kcRoleReprList = kcMappingsRepr.getClientMappings().get(appSecurityProperties.getTargetKeycloakClientFriendlyId()).getMappings();
                pUserToDecorateDTO.setClientRoles(kcRoleReprList.stream().map(KCRoleRepresentation::getName).collect(Collectors.toList()));
            }

        }

        kcGroupReprList = keycloakUserMgmtAPIRepository.listGroupsAssignedToUser(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                                pUserToDecorateDTO.getId(),
                                                                                strOAuth2AccessToken);

        if (!CollectionUtils.isEmpty(kcGroupReprList)) {
            pUserToDecorateDTO.setGroups(kcGroupReprList.stream().map(KCGroupRepresentation::getName).collect(Collectors.toList()));
        }

    }

    public AuthenticatedUserDTO authenticateUserOnKeycloak(LoginInfoDTO pLoginInfoDTO) {
        AuthenticatedUserDTO authUserDTO = null;
        KeyCloakParamsHolderDTO paramsDTO = null;
        JWTTokenDTO jwtFromAPI = null;
        UserDTO userDTO = null;

        paramsDTO = new KeyCloakParamsHolderDTO();
        paramsDTO.setGrantType(appSecurityProperties.getTargetKeycloakGrantTypeForUserAuth());
        paramsDTO.setUsername(pLoginInfoDTO.getUsername());
        paramsDTO.setPassword(pLoginInfoDTO.getPassword());
        if (pLoginInfoDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
            paramsDTO.setClientId(appSecurityProperties.getAdminKeycloakClientFriendlyId());
            jwtFromAPI = iKeycloakTokenAPIRepository.getAdminJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapForFirstLogin());
        } else {
            paramsDTO.setClientId(appSecurityProperties.getTargetKeycloakClientFriendlyId());
            paramsDTO.setClientSecret(appSecurityProperties.getTargetKeycloakClientSecret());
            paramsDTO.setScope(appSecurityProperties.getTargetKeycloakScopeForUserAuth());
            jwtFromAPI = iKeycloakTokenAPIRepository.getUserJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapForRegularUserLogin());
        }

        if (jwtFromAPI != null) {
            jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
            jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
            if (pLoginInfoDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
                userDTO = new UserDTO();
                userDTO.setUsername(appSecurityProperties.getAdminKeycloakSystemAccountUsername());
                authUserDTO = new AuthenticatedUserDTO(jwtFromAPI, userDTO, MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN);
            } else {
                userDTO = this.searchUserByUsername(pLoginInfoDTO.getUsername()).get();
                authUserDTO = new AuthenticatedUserDTO(jwtFromAPI, userDTO, MacroAccountTypeEnum.USER_ACCOUNT_TYPE_REGULAR);
            }
        }

        return authUserDTO;
    }

    public AuthenticatedUserDTO refreshTokenAndUpdateAuthUser(String pUsername, Boolean pForceRefresh, String pRefreshTokenValue) {
        AuthenticatedUserDTO authUserDTO = null;
        JWTTokenDTO jwtFromAPI = null;
        JWTTokenDTO refreshedJwtFromAPI = null;
        KeyCloakParamsHolderDTO paramsDTO = null;
        UserDTO userDTO = null;

        authUserDTO = SecurityContextUtils.getAllCreatedJWTTokensMap().get(pUsername);
        jwtFromAPI = authUserDTO.getJwtTokenDTO();
        if (pForceRefresh || jwtFromAPI.isAccessTokenExpired()) {
            paramsDTO = new KeyCloakParamsHolderDTO();
            paramsDTO.setGrantType(appSecurityProperties.getAdminKeycloakGrantTypeForRefreshToken());
            if (StringUtils.isEmpty(pRefreshTokenValue)) {
                paramsDTO.setRefreshToken(jwtFromAPI.getRefreshToken());
            } else {
                paramsDTO.setRefreshToken(pRefreshTokenValue);
            }
            if (authUserDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_SERVICE_ADMIN)) {
                paramsDTO.setClientId(appSecurityProperties.getAdminKeycloakClientFriendlyId());
                paramsDTO.setClientSecret("");
                refreshedJwtFromAPI = iKeycloakTokenAPIRepository.getAdminJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapToRefreshToken());
            } else {
                paramsDTO.setClientId(appSecurityProperties.getTargetKeycloakClientFriendlyId());
                paramsDTO.setClientSecret(appSecurityProperties.getTargetKeycloakClientSecret());
                refreshedJwtFromAPI = iKeycloakTokenAPIRepository.getUserJWTTokenFromKeyCloakAPI(paramsDTO.getAsMultiValueMapToRefreshToken());
            }
            if (refreshedJwtFromAPI != null) {
                jwtFromAPI = refreshedJwtFromAPI;
                jwtFromAPI.setLastDateTimeAccessToken(LocalDateTime.now());
                jwtFromAPI.setLastDateTimeRefreshToken(LocalDateTime.now());
                authUserDTO.setJwtTokenDTO(jwtFromAPI);

                if (authUserDTO.getMacroAccountTypeEnum().equals(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_REGULAR)) {
                    userDTO = this.searchUserByUsername(pUsername).get();
                    authUserDTO.setUserDTO(userDTO);
                }

            }
        }
        return authUserDTO;
    }

}
