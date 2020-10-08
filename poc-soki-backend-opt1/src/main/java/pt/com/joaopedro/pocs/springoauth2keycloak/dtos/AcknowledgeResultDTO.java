package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import lombok.Data;

@Data
public class AcknowledgeResultDTO<T> {

    private String statusResponse;
    private String responseMessage;
    private T payloadResponse;

}
