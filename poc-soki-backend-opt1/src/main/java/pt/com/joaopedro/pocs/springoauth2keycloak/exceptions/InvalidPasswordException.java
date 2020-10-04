package pt.com.joaopedro.pocs.springoauth2keycloak.exceptions;

public class InvalidPasswordException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public InvalidPasswordException(String defaultMessage) {
        super(defaultMessage);
    }

}
