package pt.com.joaopedro.pocs.springoauth2keycloak.exceptions;

public class BadRequestAlertException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public BadRequestAlertException(String defaultMessage) {
        super(defaultMessage);
    }

}
