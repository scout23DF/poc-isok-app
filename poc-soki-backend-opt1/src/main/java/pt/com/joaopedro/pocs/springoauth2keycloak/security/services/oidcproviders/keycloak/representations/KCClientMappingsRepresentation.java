package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Data
@RequiredArgsConstructor
public class KCClientMappingsRepresentation {

    private String	client;
    private String	id;
    private List<KCRoleRepresentation> mappings;

}
