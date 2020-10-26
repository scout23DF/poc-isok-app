package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.mappers;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.UserDTO;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.mappers.ICommonRepresentationOIDCMapper;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.services.oidcproviders.keycloak.representations.KCUserRepresentation;

@Mapper(componentModel = "spring", uses = {})
public interface IUserMapper extends ICommonRepresentationOIDCMapper<UserDTO, KCUserRepresentation> {

    @Mapping(target = "clientRoles", ignore = true)
    KCUserRepresentation toRepresentationOIDC(UserDTO pObjDTO);

    @Mapping(target = "clientRoles", ignore = true)
    UserDTO toDTO(KCUserRepresentation pObjReprOIDC);

    /*
    @Mapping(target = "clientRoles", ignore = true)
    UserDTO kCUserRepresentationToUserDTO(KCUserRepresentation entity);

    @Mapping(target = "clientRoles", ignore = true)
    KCUserRepresentation userDTOToKCUserRepresentation(UserDTO dto);
    */

    default KCUserRepresentation fromId(String id) {
        if (id == null) {
            return null;
        }
        KCUserRepresentation kcUserRepresentation = new KCUserRepresentation();
        kcUserRepresentation.setId(id);
        return kcUserRepresentation;
    }

}
