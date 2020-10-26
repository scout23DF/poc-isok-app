package pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos;

import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * View Model object for storing a user's credentials.
 */
@Data
@ToString(exclude = "password")
public class UserDTO {

    // https://www.keycloak.org/docs-api/5.0/rest-api/index.html#_userrepresentation

    private String id;

    @NotNull
    @Size(min = 1, max = 50)
    private String username;

    @NotNull
    @Size(min = 1, max = 50)
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50)
    private String lastName;

    @Size(min = 4, max = 100)
    private String password;

    @Email
    private String email;
    private Boolean enabled;
    private Boolean emailVerified = true;

    private List<String> realmRoles;
    private List<String> clientRoles;
    private List<String> groups;

}
