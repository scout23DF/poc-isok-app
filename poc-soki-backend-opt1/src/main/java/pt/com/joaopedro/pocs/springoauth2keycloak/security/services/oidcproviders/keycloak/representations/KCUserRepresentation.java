package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Data
public class KCUserRepresentation {

    // https://www.keycloak.org/docs-api/5.0/rest-api/index.html#_userrepresentation

    private String self; // link
    private String id;
    private String origin;
    private Long createdTimestamp;
    private String username;
    private Boolean enabled;
    private Boolean totp;
    private Boolean emailVerified;
    private String firstName;
    private String lastName;
    private String email;
    private String federationLink;
    private String serviceAccountClientId; // For rep, it points to clientId (not DB ID)
    private Integer notBefore;

    private List<KCCredentialRepresentation> credentials;
    private Set<String> disableableCredentialTypes;
    private List<String> requiredActions;
    private List<String> realmRoles;
    private Map<String, List<String>> clientRoles;
    private List<String> groups;
    private Map<String, Boolean> access;

    // private Map<String, List<String>> attributes;
    // private List<FederatedIdentityRepresentation> federatedIdentities;
    // private List<UserConsentRepresentation> clientConsents;

}
