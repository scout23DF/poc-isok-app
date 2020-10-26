package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations;

import lombok.Data;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import java.util.List;

@Data
@RequiredArgsConstructor
public class KCGroupRepresentation {

    @NonNull
    private String id;

    @NonNull
    private String name;

    private String path;

    private List<KCGroupRepresentation> subGroups;

}
