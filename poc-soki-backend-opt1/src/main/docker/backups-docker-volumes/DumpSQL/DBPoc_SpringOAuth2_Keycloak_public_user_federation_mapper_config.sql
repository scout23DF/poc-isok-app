create table user_federation_mapper_config
(
    user_federation_mapper_id varchar(36)  not null
        constraint fk_fedmapper_cfg
            references user_federation_mapper,
    value                     varchar(255),
    name                      varchar(255) not null,
    constraint constraint_fedmapper_cfg_pm
        primary key (user_federation_mapper_id, name)
);

alter table user_federation_mapper_config
    owner to dbamaster01;

grant select on user_federation_mapper_config to replicator;

