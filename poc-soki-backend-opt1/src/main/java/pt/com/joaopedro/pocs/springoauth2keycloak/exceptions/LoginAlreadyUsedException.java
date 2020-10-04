package pt.com.joaopedro.pocs.springoauth2keycloak.exceptions;

public class LoginAlreadyUsedException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public LoginAlreadyUsedException() {
        super("Login name already used!");
    }
}
