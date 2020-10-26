package pt.com.joaopedro.pocs.springoauth2keycloak.security.services.mappers;

import java.util.List;

public interface ICommonRepresentationOIDCMapper <TObjDTO, TObjRepresentationOIDC> {

    TObjRepresentationOIDC toRepresentationOIDC(TObjDTO pObjDTO);

    TObjDTO toDTO(TObjRepresentationOIDC pObjReprOIDC);

    List <TObjRepresentationOIDC> toRepresentationOIDCList(List<TObjDTO> pObjDTOList);

    List <TObjDTO> toDTOList(List<TObjRepresentationOIDC> pObjReprOIDCList);

}
