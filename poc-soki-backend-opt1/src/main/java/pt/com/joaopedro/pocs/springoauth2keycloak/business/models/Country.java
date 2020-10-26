package pt.com.joaopedro.pocs.springoauth2keycloak.business.models;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * A Sample Entity to Store Country Data
 */
@Data
@AllArgsConstructor
public class Country {

    private Long id;

    @NotNull
    @Size(min = 1, max = 5)
    private String alias;

    @NotNull
    @Size(min = 1, max = 50)
    private String name;

    @NotNull
    private String continent;

}
