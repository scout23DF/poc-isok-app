create table fed_user_credential
(
    id                  varchar(36)  not null
        constraint constr_fed_user_cred_pk
            primary key,
    salt                bytea,
    type                varchar(255),
    created_date        bigint,
    user_id             varchar(255) not null,
    realm_id            varchar(36)  not null,
    storage_provider_id varchar(36),
    user_label          varchar(255),
    secret_data         text,
    credential_data     text,
    priority            integer
);

alter table fed_user_credential
    owner to dbamaster01;

grant select on fed_user_credential to replicator;

create index idx_fu_credential
    on fed_user_credential (user_id, type);

create index idx_fu_credential_ru
    on fed_user_credential (realm_id, user_id);

