package pt.com.joaopedro.pocs.springoauth2keycloak;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * Spring boot application start up class. You may run this class to start the application.
 * <p>
 * We are excluding {@link SecurityAutoConfiguration} and {@link UserDetailsServiceAutoConfiguration}
 * to disable spring default basic authentication.
 * </p>
 * Note: If you are using Spring 1.x you may exclude only {@link SecurityAutoConfiguration}.
 */
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class,
                                  UserDetailsServiceAutoConfiguration.class})
@EnableFeignClients
public class PoCSpringOAuth2KeyCloakAppStartup {

    public static void main(String[] args) {
        SpringApplication.run(PoCSpringOAuth2KeyCloakAppStartup.class, args);
    }

}
