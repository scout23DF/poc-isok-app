package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@RequiredArgsConstructor
public class KCMappingsRepresentation {

    protected List<KCRoleRepresentation> realmMappings;
    protected Map<String, KCClientMappingsRepresentation> clientMappings ;

}
