create table fed_user_consent
(
    id                      varchar(36)  not null
        constraint constr_fed_user_consent_pk
            primary key,
    client_id               varchar(255),
    user_id                 varchar(255) not null,
    realm_id                varchar(36)  not null,
    storage_provider_id     varchar(36),
    created_date            bigint,
    last_updated_date       bigint,
    client_storage_provider varchar(36),
    external_client_id      varchar(255)
);

alter table fed_user_consent
    owner to dbamaster01;

grant select on fed_user_consent to replicator;

create index idx_fu_consent_ru
    on fed_user_consent (realm_id, user_id);

create index idx_fu_cnsnt_ext
    on fed_user_consent (user_id, client_storage_provider, external_client_id);

create index idx_fu_consent
    on fed_user_consent (user_id, client_id);

