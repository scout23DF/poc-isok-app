package pt.com.joaopedro.pocs.springoauth2keycloak.security.exceptions;

import pt.com.joaopedro.pocs.springoauth2keycloak.commons.exceptions.BadRequestAlertException;

public class EmailAlreadyUsedException extends BadRequestAlertException {

    private static final long serialVersionUID = 1L;

    public EmailAlreadyUsedException() {
        super("Email is already in use!");
    }
}
