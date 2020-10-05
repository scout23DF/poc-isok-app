package pt.com.joaopedro.pocs.springoauth2keycloak.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import static springfox.documentation.builders.PathSelectors.regex;

@Configuration
@EnableSwagger2
public class Swagger2Configuration {

  @Bean
  public Docket swaggerApi() {
    return new Docket(DocumentationType.SWAGGER_2)
            .apiInfo(apiInfo())
            .select()
            .apis(RequestHandlerSelectors.basePackage("pt.com.joaopedro.pocs.springoauth2keycloak.web.rest"))
            .paths(regex(".*?"))
            .build();
  }

  private ApiInfo apiInfo() {
    return new ApiInfoBuilder()
            .title("PoC Proxy Spring OAuth2 KeyCloak REST API's")
            .description("REST API's to Proxy calls between my Clients and OIDC's (KeyCloak, Google+, etc..)")
            .build();
  }

}