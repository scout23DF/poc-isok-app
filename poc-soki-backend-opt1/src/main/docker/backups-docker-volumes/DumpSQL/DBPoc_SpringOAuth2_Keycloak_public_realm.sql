create table realm
(
    id                           varchar(36)               not null
        constraint constraint_4a
            primary key,
    access_code_lifespan         integer,
    user_action_lifespan         integer,
    access_token_lifespan        integer,
    account_theme                varchar(255),
    admin_theme                  varchar(255),
    email_theme                  varchar(255),
    enabled                      boolean     default false not null,
    events_enabled               boolean     default false not null,
    events_expiration            bigint,
    login_theme                  varchar(255),
    name                         varchar(255)
        constraint uk_orvsdmla56612eaefiq6wl5oi
            unique,
    not_before                   integer,
    password_policy              varchar(2550),
    registration_allowed         boolean     default false not null,
    remember_me                  boolean     default false not null,
    reset_password_allowed       boolean     default false not null,
    social                       boolean     default false not null,
    ssl_required                 varchar(255),
    sso_idle_timeout             integer,
    sso_max_lifespan             integer,
    update_profile_on_soc_login  boolean     default false not null,
    verify_email                 boolean     default false not null,
    master_admin_client          varchar(36),
    login_lifespan               integer,
    internationalization_enabled boolean     default false not null,
    default_locale               varchar(255),
    reg_email_as_username        boolean     default false not null,
    admin_events_enabled         boolean     default false not null,
    admin_events_details_enabled boolean     default false not null,
    edit_username_allowed        boolean     default false not null,
    otp_policy_counter           integer     default 0,
    otp_policy_window            integer     default 1,
    otp_policy_period            integer     default 30,
    otp_policy_digits            integer     default 6,
    otp_policy_alg               varchar(36) default 'HmacSHA1'::character varying,
    otp_policy_type              varchar(36) default 'totp'::character varying,
    browser_flow                 varchar(36),
    registration_flow            varchar(36),
    direct_grant_flow            varchar(36),
    reset_credentials_flow       varchar(36),
    client_auth_flow             varchar(36),
    offline_session_idle_timeout integer     default 0,
    revoke_refresh_token         boolean     default false not null,
    access_token_life_implicit   integer     default 0,
    login_with_email_allowed     boolean     default true  not null,
    duplicate_emails_allowed     boolean     default false not null,
    docker_auth_flow             varchar(36),
    refresh_token_max_reuse      integer     default 0,
    allow_user_managed_access    boolean     default false not null,
    sso_max_lifespan_remember_me integer     default 0     not null,
    sso_idle_timeout_remember_me integer     default 0     not null
);

alter table realm
    owner to dbamaster01;

grant select on realm to replicator;

create index idx_realm_master_adm_cli
    on realm (master_admin_client);

INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) VALUES ('PoC-Soki-Realm-01', 60, 300, 300, null, null, null, true, false, 0, null, 'PoC-Soki-Realm-01', 0, null, true, true, true, false, 'EXTERNAL', 1800, 36000, false, false, '1b7a1f93-5791-449b-b19a-7c8892118d6e', 1800, false, null, false, false, false, true, 0, 1, 30, 6, 'HmacSHA1', 'totp', '2c0c1961-ff54-475f-8c2f-b8eee5057963', '544a14d2-b811-4bfc-b356-fb6f885673a2', '8466abf3-f22d-4ee2-a74a-4dc84be73796', '213bf824-1e46-4b02-a8f5-4b7d336b1c9e', '70a0a3d3-6218-4326-88bf-9e2465a11af9', 2592000, false, 900, false, false, '90f9fa6c-bd54-46a1-b979-82e853b15a4e', 0, false, 0, 0);
INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) VALUES ('master', 60, 300, 60, null, null, null, true, false, 0, null, 'master', 0, null, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '72ae90e4-4635-4bd9-9605-a1d8898d6a96', 1800, false, null, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', 'e2421ed3-640f-428c-a36d-b0b69aac8397', 'e0aa35a8-63c1-44ec-8dc5-8a46775bd416', '8792a834-dc93-49c2-80c1-0c231b6b3417', '22ff9a1b-e8a2-4c5f-9d9c-829b85bb8291', '9c2d37f2-0034-46ff-a79b-c9bea9106063', 2592000, false, 900, true, false, '6d46a9c3-db40-4126-a1c0-e80d8ca3ef21', 0, false, 0, 0);