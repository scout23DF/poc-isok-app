create table user_federation_mapper
(
    id                     varchar(36)  not null
        constraint constraint_fedmapperpm
            primary key,
    name                   varchar(255) not null,
    federation_provider_id varchar(36)  not null
        constraint fk_fedmapperpm_fedprv
            references user_federation_provider,
    federation_mapper_type varchar(255) not null,
    realm_id               varchar(36)  not null
        constraint fk_fedmapperpm_realm
            references realm
);

alter table user_federation_mapper
    owner to dbamaster01;

grant select on user_federation_mapper to replicator;

create index idx_usr_fed_map_fed_prv
    on user_federation_mapper (federation_provider_id);

create index idx_usr_fed_map_realm
    on user_federation_mapper (realm_id);

