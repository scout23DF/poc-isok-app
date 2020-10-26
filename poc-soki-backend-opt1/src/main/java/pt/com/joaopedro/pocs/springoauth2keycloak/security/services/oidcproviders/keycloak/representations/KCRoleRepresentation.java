package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@RequiredArgsConstructor
public class KCRoleRepresentation {

    @NonNull
    private String id;

    @NonNull
    private String name;

    private String description;

    private boolean composite;

    @NonNull
    private Boolean clientRole;

    private String containerId;

    private Map<String, List<String>> attributes;


    // @Deprecated
    // private Boolean scopeParamRequired;
    // private Composites composites;

}
