package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class KCCredentialRepresentation {

    public static final String SECRET = "secret";
    public static final String PASSWORD = "password";
    public static final String TOTP = "totp";
    public static final String HOTP = "hotp";
    public static final String KERBEROS = "kerberos";

    private String id;

    @NonNull
    private String type;

    private String userLabel;

    private Long createdDate;

    private String secretData;

    private String credentialData;

    private Integer priority;

    @NonNull
    private String value;

    // only used when updating a credential.  Might set required action
    protected Boolean temporary = false;

}
