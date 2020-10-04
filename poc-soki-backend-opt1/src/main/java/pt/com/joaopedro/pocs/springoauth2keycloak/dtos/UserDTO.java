package pt.com.joaopedro.pocs.springoauth2keycloak.dtos;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import lombok.ToString;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * View Model object for storing a user's credentials.
 */
@Data
@ToString(exclude = "password")
@JsonIgnoreProperties(ignoreUnknown = true)
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

    private Boolean enabled;

    @Email
    private String email;

    @JsonIgnore
    public String getPassword() {
        return this.password;
    }
    @JsonProperty
    public void setPassword(String pValor) {
        this.password = pValor;
    }

}
