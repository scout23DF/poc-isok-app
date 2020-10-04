create table component
(
    id            varchar(36) not null
        constraint constr_component_pk
            primary key,
    name          varchar(255),
    parent_id     varchar(36),
    provider_id   varchar(36),
    provider_type varchar(255),
    realm_id      varchar(36)
        constraint fk_component_realm
            references realm,
    sub_type      varchar(255)
);

alter table component
    owner to dbamaster01;

grant select on component to replicator;

create index idx_component_realm
    on component (realm_id);

create index idx_component_provider_type
    on component (provider_type);

INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5dca6888-a14e-49fd-912e-eb4d32f5fd2c', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('86afd2ce-c198-447b-b5af-f0f6a543cc03', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('f459e908-413e-4cd8-b7f7-10d057ef74d4', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('94f4b010-fa7e-4fa7-803d-fc2af053ffa0', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('093492b8-d02e-4db2-88c4-0bb423dcacea', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('ce1ded20-b675-459e-89a8-ac752a2f356c', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('85f469a3-65fe-417a-aea5-a3fd3b9200a8', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5486006d-640f-4256-8f8c-e87810fc3248', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('36907b15-31b4-42de-93af-4ed9181b998a', 'fallback-HS256', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', null);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('46cd88cc-29f9-44b2-bdcf-718ab434411a', 'fallback-RS256', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', null);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('88d15524-5ef0-4418-9cca-ae869befcc91', 'rsa-generated', 'PoC-Soki-Realm-01', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'PoC-Soki-Realm-01', null);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b5506abc-eb9f-408e-b9e6-4070d64d5903', 'hmac-generated', 'PoC-Soki-Realm-01', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'PoC-Soki-Realm-01', null);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('f45384cf-21bd-4a64-a1da-c9a86eab4dd6', 'aes-generated', 'PoC-Soki-Realm-01', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'PoC-Soki-Realm-01', null);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2bb6f943-1886-4d24-8254-e9c3c80642e1', 'Trusted Hosts', 'PoC-Soki-Realm-01', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('8132f8e1-d50e-44cf-8009-f06b52b9fed1', 'Consent Required', 'PoC-Soki-Realm-01', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('cb45bb47-7f19-47ba-bc29-8f98128ac2a3', 'Full Scope Disabled', 'PoC-Soki-Realm-01', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('8444f2a0-5a25-450c-af9b-19b867c19c32', 'Max Clients Limit', 'PoC-Soki-Realm-01', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('0a10a28b-ac15-4e04-a846-6dcfa3a34bdd', 'Allowed Protocol Mapper Types', 'PoC-Soki-Realm-01', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('bd27e2d8-ddb4-41a0-8c0e-90013c678d34', 'Allowed Client Scopes', 'PoC-Soki-Realm-01', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('c13de266-ba61-426c-b751-b72e04262fa4', 'Allowed Protocol Mapper Types', 'PoC-Soki-Realm-01', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2c1a96ba-fc4d-4273-83d2-120de2603009', 'Allowed Client Scopes', 'PoC-Soki-Realm-01', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'PoC-Soki-Realm-01', 'authenticated');