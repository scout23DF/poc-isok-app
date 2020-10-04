create table idp_mapper_config
(
    idp_mapper_id varchar(36)  not null
        constraint fk_idpmconfig
            references identity_provider_mapper,
    value         text,
    name          varchar(255) not null,
    constraint constraint_idpmconfig
        primary key (idp_mapper_id, name)
);

alter table idp_mapper_config
    owner to dbamaster01;

grant select on idp_mapper_config to replicator;

