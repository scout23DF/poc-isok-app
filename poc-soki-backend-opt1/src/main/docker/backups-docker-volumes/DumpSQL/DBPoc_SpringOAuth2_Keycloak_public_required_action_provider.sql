create table required_action_provider
(
    id             varchar(36)           not null
        constraint constraint_req_act_prv_pk
            primary key,
    alias          varchar(255),
    name           varchar(255),
    realm_id       varchar(36)
        constraint fk_req_act_realm
            references realm,
    enabled        boolean default false not null,
    default_action boolean default false not null,
    provider_id    varchar(255),
    priority       integer
);

alter table required_action_provider
    owner to dbamaster01;

grant select on required_action_provider to replicator;

create index idx_req_act_prov_realm
    on required_action_provider (realm_id);

INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('437fc11e-691e-4483-a79f-1b56d1675602', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('8596df47-ff5b-4268-8f91-98b741e824c5', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('553e0d4c-fdae-40da-b8f3-50ac4a27e968', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('3d1b50f3-d4f5-4443-9560-95d09788df5f', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('1b5e238f-e092-45dc-8dc5-ebe0873eac6e', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('24aa1e8c-e252-40ad-991b-027cfa62405d', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('c039855c-10be-4bca-925e-22bce59b242c', 'VERIFY_EMAIL', 'Verify Email', 'PoC-Soki-Realm-01', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('7fa85185-8cd1-49bf-8d24-a5aa599e1e2c', 'UPDATE_PROFILE', 'Update Profile', 'PoC-Soki-Realm-01', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('7ce756f7-4061-4788-be51-5eb6bd2c1460', 'CONFIGURE_TOTP', 'Configure OTP', 'PoC-Soki-Realm-01', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('64c7fed7-f71a-4971-af96-23b88fcf8230', 'UPDATE_PASSWORD', 'Update Password', 'PoC-Soki-Realm-01', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('eb57f9c8-a83c-48a1-bf89-04e8bfa0a640', 'terms_and_conditions', 'Terms and Conditions', 'PoC-Soki-Realm-01', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('7e2dcf2a-8e29-4885-9029-11c77ab6090d', 'update_user_locale', 'Update User Locale', 'PoC-Soki-Realm-01', true, false, 'update_user_locale', 1000);