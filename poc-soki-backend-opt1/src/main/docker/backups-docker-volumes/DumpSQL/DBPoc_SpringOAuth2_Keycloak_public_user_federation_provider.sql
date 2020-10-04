create table user_federation_provider
(
    id                  varchar(36) not null
        constraint constraint_5c
            primary key,
    changed_sync_period integer,
    display_name        varchar(255),
    full_sync_period    integer,
    last_sync           integer,
    priority            integer,
    provider_name       varchar(255),
    realm_id            varchar(36)
        constraint fk_1fj32f6ptolw2qy60cd8n01e8
            references realm
);

alter table user_federation_provider
    owner to dbamaster01;

grant select on user_federation_provider to replicator;

create index idx_usr_fed_prv_realm
    on user_federation_provider (realm_id);

