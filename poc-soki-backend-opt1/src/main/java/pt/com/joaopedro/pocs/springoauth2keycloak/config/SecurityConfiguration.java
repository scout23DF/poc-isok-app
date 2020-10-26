package pt.com.joaopedro.pocs.springoauth2keycloak.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.security.oauth2.resource.ResourceServerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.JwtAccessTokenCustomizer;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.utils.AppSecurityProperties;

/**
 * SecurityConfigurer is to configure ResourceServer and HTTP Security.
 * <p>
 *   Please make sure you check HTTP Security configuration and change is as per your needs.
 * </p>
 *
 * Note: Use {@link AppSecurityProperties} to configure required CORs configuration and enable or disable security of application.
 */
@Configuration
@EnableWebSecurity
@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled = true)
@ConditionalOnProperty(prefix = "rest.security", value = "enabled", havingValue = "true")
@Import({AppSecurityProperties.class})
public class SecurityConfiguration extends ResourceServerConfigurerAdapter {

  private ResourceServerProperties resourceServerProperties;

  private AppSecurityProperties appSecurityProperties;

  /* Using spring constructor injection, @Autowired is implicit */
  public SecurityConfiguration(ResourceServerProperties resourceServerProperties, AppSecurityProperties appSecurityProperties) {
    this.resourceServerProperties = resourceServerProperties;
    this.appSecurityProperties = appSecurityProperties;
  }

  @Override
  public void configure(ResourceServerSecurityConfigurer resources) throws Exception {
    resources.resourceId(resourceServerProperties.getResourceId());
  }

  // @Override
  public void configure(WebSecurity web) {
    web.ignoring()
            .antMatchers(HttpMethod.OPTIONS, "/**")
            .antMatchers("/app/**/*.{js,html}")
            .antMatchers("/i18n/**")
            .antMatchers("/content/**")
            .antMatchers("/swagger-ui/index.html")
            .antMatchers("/test/**");
  }

  @Override
  public void configure(final HttpSecurity http) throws Exception {

    http.cors()
        .configurationSource(corsConfigurationSource())
        .and()
        .headers()
        .frameOptions()
        .disable()
        .and()
        .csrf()
        .disable()
        .authorizeRequests()
        .antMatchers(appSecurityProperties.getApiMatcher()).authenticated()
        .antMatchers("/swagger-ui/**").permitAll();

  }

  @Bean
  public CorsConfigurationSource corsConfigurationSource() {
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    if (null != appSecurityProperties.getCorsConfiguration()) {
      source.registerCorsConfiguration("/**", appSecurityProperties.getCorsConfiguration());
    }
    return source;
  }

  @Bean
  public JwtAccessTokenCustomizer jwtAccessTokenCustomizer(ObjectMapper mapper) {
    return new JwtAccessTokenCustomizer(mapper);
  }
}
