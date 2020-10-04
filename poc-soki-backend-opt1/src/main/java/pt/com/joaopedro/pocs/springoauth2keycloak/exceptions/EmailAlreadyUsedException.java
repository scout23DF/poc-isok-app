package pt.com.joaopedro.pocs.springoauth2keycloak.exceptions;

public class EmailAlreadyUsedException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public EmailAlreadyUsedException() {
        super("Email is already in use!");
    }
}
