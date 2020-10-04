create table authentication_flow
(
    id          varchar(36)                                         not null
        constraint constraint_auth_flow_pk
            primary key,
    alias       varchar(255),
    description varchar(255),
    realm_id    varchar(36)
        constraint fk_auth_flow_realm
            references realm,
    provider_id varchar(36) default 'basic-flow'::character varying not null,
    top_level   boolean     default false                           not null,
    built_in    boolean     default false                           not null
);

alter table authentication_flow
    owner to dbamaster01;

grant select on authentication_flow to replicator;

create index idx_auth_flow_realm
    on authentication_flow (realm_id);

INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e2421ed3-640f-428c-a36d-b0b69aac8397', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1d08752a-042e-470a-a2b5-237bb74e43a3', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f6435aee-ede4-46da-8642-3a869efdc804', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('8792a834-dc93-49c2-80c1-0c231b6b3417', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('0128f94c-6774-4ac2-ab7a-b256c09d6fa3', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e0aa35a8-63c1-44ec-8dc5-8a46775bd416', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f9df1de7-b28e-4cf0-b3b9-53ce6a00241a', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('22ff9a1b-e8a2-4c5f-9d9c-829b85bb8291', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('60fb30b5-b2ee-4456-8b60-b3f6c0ef51ba', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('9c2d37f2-0034-46ff-a79b-c9bea9106063', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('91d600e3-2a57-4f30-b95f-7f46047d42a7', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('43ce4d49-611d-4bd0-b2e9-559a527128ef', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f95c536a-f64c-4b72-9dcd-db6a081da540', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('03750696-8ae3-4ed0-857e-db1be570caeb', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('76a91357-3268-4707-aafe-d36a84c4d252', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('525d4b66-e3a9-4963-8715-f4163271fb40', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3bf82565-c72e-41b4-8f54-8552aa6abb03', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('6d46a9c3-db40-4126-a1c0-e80d8ca3ef21', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4a23d1a2-a7bb-490e-9cdf-6894bfce6d79', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('19892e01-5fd5-460c-a49b-c3769d3d78c6', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('2c0c1961-ff54-475f-8c2f-b8eee5057963', 'browser', 'browser based authentication', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('b608c428-9033-4e61-8cff-e99734881afd', 'forms', 'Username, password, otp and other auth forms.', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('89de50e1-808f-4beb-89f2-ca3759b171d9', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('8466abf3-f22d-4ee2-a74a-4dc84be73796', 'direct grant', 'OpenID Connect Resource Owner Grant', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('d3b5d2e8-b6b0-44ea-9e53-7b81339de30e', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('544a14d2-b811-4bfc-b356-fb6f885673a2', 'registration', 'registration flow', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('6ad8f559-86fd-47c5-8b38-ffe4914281c7', 'registration form', 'registration form', 'PoC-Soki-Realm-01', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('213bf824-1e46-4b02-a8f5-4b7d336b1c9e', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('42d66b02-4af7-432d-a764-72e87ba72a86', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('70a0a3d3-6218-4326-88bf-9e2465a11af9', 'clients', 'Base authentication for clients', 'PoC-Soki-Realm-01', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ba13dd23-fe6a-46bd-845e-954e037314e2', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1e066871-e99f-4627-b4ba-09d1b373e9f6', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('890651f4-bd46-498b-bcdb-736af9ff9724', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('89790159-7d84-42d9-8dae-774269699875', 'Account verification options', 'Method with which to verity the existing account', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('aeac48dd-e7ec-481d-83f9-4e0385a8a91f', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e4890a4c-91e2-4aac-9e6a-139be3f48fe7', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'PoC-Soki-Realm-01', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('62b0aa18-95a9-478e-a328-ab7fd0417801', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('90f9fa6c-bd54-46a1-b979-82e853b15a4e', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('769b70b8-13da-4684-ba19-c64e4e9f8b3b', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'PoC-Soki-Realm-01', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4969e303-9b66-4f9c-ac9a-baa3e2b0915a', 'Authentication Options', 'Authentication options.', 'PoC-Soki-Realm-01', 'basic-flow', false, true);