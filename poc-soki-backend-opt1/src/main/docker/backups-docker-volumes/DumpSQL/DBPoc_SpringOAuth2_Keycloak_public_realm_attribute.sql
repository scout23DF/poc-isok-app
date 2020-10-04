create table realm_attribute
(
    name     varchar(255) not null,
    value    varchar(255),
    realm_id varchar(36)  not null
        constraint fk_8shxd6l3e9atqukacxgpffptw
            references realm,
    constraint constraint_9
        primary key (name, realm_id)
);

alter table realm_attribute
    owner to dbamaster01;

grant select on realm_attribute to replicator;

create index idx_realm_attr_realm
    on realm_attribute (realm_id);

INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xRobotsTag', 'none', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('bruteForceProtected', 'false', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('permanentLockout', 'false', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('maxFailureWaitSeconds', '900', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('minimumQuickLoginWaitSeconds', '60', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('waitIncrementSeconds', '60', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('quickLoginCheckMilliSeconds', '1000', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('maxDeltaTimeSeconds', '43200', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('failureFactor', '30', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('displayName', 'Keycloak', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('displayNameHtml', '<div class="kc-logo-text"><span>Keycloak</span></div>', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('offlineSessionMaxLifespan', '5184000', 'master');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('clientSessionIdleTimeout', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('clientSessionMaxLifespan', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('clientOfflineSessionIdleTimeout', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('clientOfflineSessionMaxLifespan', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('displayName', 'Realm for WebSSO of Spring-OAuth2-KeyCloak PoC :: Joao Pedro :: UpWork', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('displayNameHtml', 'Realm for WebSSO of Spring-OAuth2-KeyCloak PoC :: Joao Pedro :: UpWork', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('bruteForceProtected', 'false', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('permanentLockout', 'false', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('maxFailureWaitSeconds', '900', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('minimumQuickLoginWaitSeconds', '60', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('waitIncrementSeconds', '60', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('quickLoginCheckMilliSeconds', '1000', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('maxDeltaTimeSeconds', '43200', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('failureFactor', '30', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('actionTokenGeneratedByAdminLifespan', '43200', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('actionTokenGeneratedByUserLifespan', '300', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('offlineSessionMaxLifespanEnabled', 'false', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('offlineSessionMaxLifespan', '5184000', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRpEntityName', 'keycloak', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicySignatureAlgorithms', 'ES256', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRpId', '', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRequireResidentKey', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyUserVerificationRequirement', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyCreateTimeout', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRpIdPasswordless', '', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyCreateTimeoutPasswordless', '0', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.contentSecurityPolicyReportOnly', '', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xContentTypeOptions', 'nosniff', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xRobotsTag', 'none', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xFrameOptions', 'SAMEORIGIN', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.contentSecurityPolicy', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.xXSSProtection', '1; mode=block', 'PoC-Soki-Realm-01');
INSERT INTO public.realm_attribute (name, value, realm_id) VALUES ('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'PoC-Soki-Realm-01');