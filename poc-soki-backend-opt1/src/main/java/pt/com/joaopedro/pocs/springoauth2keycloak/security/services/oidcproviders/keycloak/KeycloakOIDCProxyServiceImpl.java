package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak;

import feign.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import pt.com.joaopedro.pocs.springoauth2keycloak.commons.dtos.AcknowledgeResultDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.AuthenticatedUserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.JWTTokenDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.LoginInfoDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.MacroAccountTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.enums.PermissionTypeEnum;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.IAuthOIDCProxyService;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.helpers.AuthenticatedUserDetailsHelper;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.mappers.IUserMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakRoleAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.repositories.feignclients.IKeycloakUserMgmtAPIRepository;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCGroupRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCRoleRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCUserRepresentation;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.AppSecurityProperties;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.SecurityContextUtils;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
public class KeycloakOIDCProxyServiceImpl implements IAuthOIDCProxyService {

    private AuthenticatedUserDetailsHelper authenticatedUserDetailsHelper;
    private IKeycloakUserMgmtAPIRepository keycloakUserMgmtAPIRepository;
    private IKeycloakRoleAPIRepository keycloakRoleAPIRepository;
    private IUserMapper userMapper;
    private AppSecurityProperties appSecurityProperties;

    @Autowired
    public KeycloakOIDCProxyServiceImpl(AuthenticatedUserDetailsHelper authenticatedUserDetailsHelper,
                                        IKeycloakUserMgmtAPIRepository pIKeycloakUserMgmtAPIRepository,
                                        IKeycloakRoleAPIRepository pKeycloakRoleAPIRepository,
                                        IUserMapper pUserMapper,
                                        AppSecurityProperties pAppSecurityProperties) {

        this.authenticatedUserDetailsHelper = authenticatedUserDetailsHelper;
        this.keycloakUserMgmtAPIRepository = pIKeycloakUserMgmtAPIRepository;
        this.keycloakRoleAPIRepository = pKeycloakRoleAPIRepository;
        this.userMapper = pUserMapper;
        this.appSecurityProperties = pAppSecurityProperties;
    }

    @Override
    public UserDTO createUser(UserDTO pUserDTO) {
        UserDTO newUserDTO = null;
        KCUserRepresentation newKCUserRepr = null;
        Response responseFromKCAPI = null;
        String strSavedUserId = null;
        String strOAuth2AccessToken = null;
        JWTTokenDTO jwkTmp = null;

        jwkTmp = authenticatedUserDetailsHelper.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> createUser     :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        newKCUserRepr = userMapper.toRepresentationOIDC(pUserDTO);
        responseFromKCAPI = keycloakUserMgmtAPIRepository.createUserInKeyCloak(appSecurityProperties.getTargetKeycloakRealmName(), newKCUserRepr, strOAuth2AccessToken);

        if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.CREATED.value() && responseFromKCAPI.headers() != null && responseFromKCAPI.headers().containsKey("location")) {
            strSavedUserId = responseFromKCAPI.headers().get("location").iterator().next();
            strSavedUserId = strSavedUserId.substring(strSavedUserId.lastIndexOf("/") + 1);

            if (!StringUtils.isEmpty(strSavedUserId)) {

                authenticatedUserDetailsHelper.setupPasswordCredentialInUser(strSavedUserId, pUserDTO.getPassword());

                if (!CollectionUtils.isEmpty(pUserDTO.getRealmRoles())) {
                    authenticatedUserDetailsHelper.addRolesToNewUser(PermissionTypeEnum.KEYCLOAK_REALM_ROLE,
                                                                     appSecurityProperties.getTargetKeycloakRealmName(),
                                                                    null,
                                                                     strSavedUserId,
                                                                     pUserDTO.getRealmRoles());
                }

                if (!CollectionUtils.isEmpty(pUserDTO.getClientRoles())) { // pUserDTO.getClientRoles())) {
                    authenticatedUserDetailsHelper.addRolesToNewUser(PermissionTypeEnum.KEYCLOAK_CLIENT_ROLE,
                                                                      appSecurityProperties.getTargetKeycloakRealmName(),
                                                                      appSecurityProperties.getTargetKeycloakClientRealId(),
                                                                      strSavedUserId,
                                                                      pUserDTO.getClientRoles());
                }

                if (!CollectionUtils.isEmpty(pUserDTO.getGroups())) {
                    authenticatedUserDetailsHelper.addRolesToNewUser(PermissionTypeEnum.KEYCLOAK_REALM_GROUP,
                                                                     appSecurityProperties.getTargetKeycloakRealmName(),
                                                                    null,
                                                                     strSavedUserId,
                                                                     pUserDTO.getGroups());
                }

                newUserDTO = this.searchUserById(strSavedUserId).get();
            }
        } else {
            throw new RuntimeException("Error in KeyCloak Admin Client Call: " + responseFromKCAPI.toString());
        }

        return newUserDTO;
    }


    @Override
    public AcknowledgeResultDTO resetPassword(LoginInfoDTO pLoginInfoDTO) {
        AcknowledgeResultDTO ackResultDTO = new AcknowledgeResultDTO();
        Response responseFromKCAPI = null;
        UserDTO userDTO;

        if (pLoginInfoDTO != null && !StringUtils.isEmpty(pLoginInfoDTO.getUsername()) && !StringUtils.isEmpty(pLoginInfoDTO.getPassword())) {

            if (this.searchUserByUsername(pLoginInfoDTO.getUsername()).isPresent()) {
                userDTO = this.searchUserByUsername(pLoginInfoDTO.getUsername()).get();
                responseFromKCAPI = authenticatedUserDetailsHelper.setupPasswordCredentialInUser(userDTO.getId(), pLoginInfoDTO.getPassword());

                if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.NO_CONTENT.value()) {
                    ackResultDTO.setStatusResponse(HttpStatus.OK.toString());
                    ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
                } else {
                    ackResultDTO.setStatusResponse(HttpStatus.BAD_REQUEST.toString());
                    ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
                }
            }
        }

        return ackResultDTO;
    }


    @Override
    public Optional<UserDTO> searchUserById(String pUserID) {
        return authenticatedUserDetailsHelper.searchUserById(pUserID);
    }

    @Override
    public Optional<UserDTO> searchUserByUsername(String pUsername) {
        return authenticatedUserDetailsHelper.searchUserByUsername(pUsername);
    }

    @Override
    public AuthenticatedUserDTO authenticateUser(LoginInfoDTO pLoginInfoDTO) {
        AuthenticatedUserDTO authUserDTO = null;

        if (pLoginInfoDTO != null && !StringUtils.isEmpty(pLoginInfoDTO.getUsername()) && !StringUtils.isEmpty(pLoginInfoDTO.getPassword())) {
            pLoginInfoDTO.setMacroAccountTypeEnum(MacroAccountTypeEnum.USER_ACCOUNT_TYPE_REGULAR);
            authUserDTO = authenticatedUserDetailsHelper.getOrCreateKeyCloakAuthenticatedUser(pLoginInfoDTO);
        }

        return authUserDTO;
    }

    @Override
    public JWTTokenDTO refreshAccessToken(String pLoggedUsername, String pRefreshTokenValue) {
        JWTTokenDTO jwtTokenDTO = null;
        AuthenticatedUserDTO authUserDTO = null;

        if (SecurityContextUtils.getAllCreatedJWTTokensMap().containsKey(pLoggedUsername)) {
            authUserDTO = authenticatedUserDetailsHelper.refreshTokenAndUpdateAuthUser(pLoggedUsername, Boolean.TRUE, pRefreshTokenValue);
            jwtTokenDTO = authUserDTO.getJwtTokenDTO();
        }

        return jwtTokenDTO;
    }

    @Override
    public AcknowledgeResultDTO doLogoutUser(String pUsername) {
        AcknowledgeResultDTO ackResultDTO = new AcknowledgeResultDTO();
        Response responseFromKCAPI = null;
        String strOAuth2AccessToken = null;
        Optional<UserDTO> optLoggedUserDTO = null;
        UserDTO loggedUserDTO = null;

        JWTTokenDTO jwkTmp = authenticatedUserDetailsHelper.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();

        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();
        log.debug("==> searchUserByUsername() :: Date Token: " + jwkTmp.getLastDateTimeAccessToken() + " - Current Date: " + LocalDateTime.now() + " - AccessToken: " + strOAuth2AccessToken);

        optLoggedUserDTO = this.searchUserByUsername(pUsername);
        if (optLoggedUserDTO.isPresent()) {
            loggedUserDTO = optLoggedUserDTO.get();
            responseFromKCAPI = keycloakUserMgmtAPIRepository.removeAllSessions(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                                loggedUserDTO.getId(),
                                                                                strOAuth2AccessToken);
        }

        if (responseFromKCAPI != null && responseFromKCAPI.status() == HttpStatus.NO_CONTENT.value()) {
            SecurityContextUtils.getAllCreatedJWTTokensMap().remove(pUsername);
            ackResultDTO.setStatusResponse(HttpStatus.OK.toString());
            ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
        } else {
            ackResultDTO.setStatusResponse(HttpStatus.BAD_REQUEST.toString());
            ackResultDTO.setResponseMessage(responseFromKCAPI.reason());
        }

        return ackResultDTO;
    }


    @Override
    public Optional<UserDTO> searchUserByEmail(String pEmail) {
        return Optional.empty();
    }

    @Override
    public List<KCRoleRepresentation> listAllRolesAvailable(PermissionTypeEnum pPermissionType) {
        List<KCRoleRepresentation> kcRolesReprsList = null;
        JWTTokenDTO jwkTmp = null;
        String strOAuth2AccessToken = null;

        jwkTmp = authenticatedUserDetailsHelper.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        if (pPermissionType.equals(PermissionTypeEnum.KEYCLOAK_REALM_ROLE)) { // Realm Role
            kcRolesReprsList = keycloakRoleAPIRepository.findAllRealmRoles(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                           strOAuth2AccessToken);
        } else if (pPermissionType.equals(PermissionTypeEnum.KEYCLOAK_CLIENT_ROLE)) { // Client Role
            kcRolesReprsList = keycloakRoleAPIRepository.findAllClientRoles(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                            appSecurityProperties.getTargetKeycloakClientRealId(),
                                                                            strOAuth2AccessToken);
        }

        return kcRolesReprsList;
    }

    @Override
    public List<KCGroupRepresentation> listAllRealmGroupsAvailable() {
        List<KCGroupRepresentation> kcGroupsReprsList;
        JWTTokenDTO jwkTmp = null;
        String strOAuth2AccessToken = null;

        jwkTmp = authenticatedUserDetailsHelper.getOrCreateKeyCloakAuthenticatedUser(LoginInfoDTO.buildInternalKCAdminLogin(appSecurityProperties)).getJwtTokenDTO();
        strOAuth2AccessToken = "bearer " + jwkTmp.getAccessToken();

        kcGroupsReprsList = keycloakRoleAPIRepository.findAllRealmGroups(appSecurityProperties.getTargetKeycloakRealmName(),
                                                                         strOAuth2AccessToken);

        return kcGroupsReprsList;
    }

    /*
    @Override
    public List<String> getRolesCurrentLoggedUser() {
        List<String> rolesList = new ArrayList<>();
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();

        if (null != authentication) {
            authentication.getAuthorities().forEach(e -> rolesList.add(e.getAuthority()));
        }
        return rolesList;

    }
    */
}
