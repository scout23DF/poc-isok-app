create table identity_provider_mapper
(
    id              varchar(36)  not null
        constraint constraint_idpm
            primary key,
    name            varchar(255) not null,
    idp_alias       varchar(255) not null,
    idp_mapper_name varchar(255) not null,
    realm_id        varchar(36)  not null
        constraint fk_idpm_realm
            references realm
);

alter table identity_provider_mapper
    owner to dbamaster01;

grant select on identity_provider_mapper to replicator;

create index idx_id_prov_mapp_realm
    on identity_provider_mapper (realm_id);

