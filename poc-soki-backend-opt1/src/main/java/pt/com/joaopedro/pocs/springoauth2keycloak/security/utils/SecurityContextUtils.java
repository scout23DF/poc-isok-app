/*-
 * This software is the property of:
 *
 * World Fuel Services Corporation.
 * Copyright (c) 2017 World Fuel Services Corporation.
 *
 * It may not be copied, distributed or modified, in part or in whole,
 * by any means whatsoever, without the explicit written permission of World Fuel Services Corporation.
 */
package pt.com.joaopedro.pocs.springoauth2keycloak.security.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import pt.com.joaopedro.pocs.springoauth2keycloak.security.dtos.AuthenticatedUserDTO;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * SecurityContextUtils is used to get username and roles to set created by, last updated by fields.
 */
@Component
@Slf4j
public class SecurityContextUtils {

    private static final String ANONYMOUS = "anonymous";

    private static Map<String, AuthenticatedUserDTO> ALL_CREATED_JWTTOKENS_MAP = new LinkedHashMap<>();

    private SecurityContextUtils() {
    }

    public static Map<String, AuthenticatedUserDTO> getAllCreatedJWTTokensMap() {
        return ALL_CREATED_JWTTOKENS_MAP;
    }

}
