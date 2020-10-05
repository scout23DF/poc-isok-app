package pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.mappers;

import org.mapstruct.Mapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.mappers.ICommonRepresentationOIDCMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.services.oidcproviders.keycloak.representations.KCUserRepresentation;

@Mapper(componentModel = "spring", uses = {})
public interface IUserMapper extends ICommonRepresentationOIDCMapper<UserDTO, KCUserRepresentation> {

    default KCUserRepresentation fromId(String id) {
        if (id == null) {
            return null;
        }
        KCUserRepresentation kcUserRepresentation = new KCUserRepresentation();
        kcUserRepresentation.setId(id);
        return kcUserRepresentation;
    }

}
