create table user_entity
(
    id                          varchar(36)           not null
        constraint constraint_fb
            primary key,
    email                       varchar(255),
    email_constraint            varchar(255),
    email_verified              boolean default false not null,
    enabled                     boolean default false not null,
    federation_link             varchar(255),
    first_name                  varchar(255),
    last_name                   varchar(255),
    realm_id                    varchar(255),
    username                    varchar(255),
    created_timestamp           bigint,
    service_account_client_link varchar(255),
    not_before                  integer default 0     not null,
    constraint uk_dykn684sl8up1crfei6eckhd7
        unique (realm_id, email_constraint),
    constraint uk_ru8tt6t700s9v50bu18ws5ha6
        unique (realm_id, username)
);

alter table user_entity
    owner to dbamaster01;

grant select on user_entity to replicator;

create index idx_user_email
    on user_entity (email);

INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('fb674332-03e0-4959-9fc7-2e8826a0de8a', null, '79e24626-47ff-4322-a806-638d8d0ce780', false, true, null, null, null, 'master', 'admin', 1601768453009, null, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('6877c510-010f-4344-8355-40743732e9bd', null, 'fda85175-4e47-47f0-9d6c-ba129819bcf2', false, true, null, null, null, 'PoC-Soki-Realm-01', 'service-account-poc-soki-app-client-01', 1601768624231, '5067ce51-37f0-46a5-bfa2-984543e80361', 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('15b7da9a-5ddb-4f57-bd7e-bc21a314c05b', null, '8f40fba5-f2b5-4d1c-85c4-f9ab1f2ab52b', false, true, null, 'User Simple', '01', 'PoC-Soki-Realm-01', 'user.simple01', 1601768970875, null, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('1db85a5b-c7b8-4350-973d-c9fc90513819', 'manager01.from.app.proxy@poc-soki.com', 'manager01.from.app.proxy@poc-soki.com', false, true, null, 'Manager 01', 'From App Proxy', 'master', 'manager01.from.app.proxy', 1601808694878, null, 1601834894);