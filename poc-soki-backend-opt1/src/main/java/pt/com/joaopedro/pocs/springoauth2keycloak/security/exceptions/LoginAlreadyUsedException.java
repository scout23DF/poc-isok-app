package pt.com.joaopedro.pocs.springoauth2keycloak.security.exceptions;

import pt.com.joaopedro.pocs.springoauth2keycloak.commons.exceptions.BadRequestAlertException;

public class LoginAlreadyUsedException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public LoginAlreadyUsedException() {
        super("Login name already used!");
    }
}
