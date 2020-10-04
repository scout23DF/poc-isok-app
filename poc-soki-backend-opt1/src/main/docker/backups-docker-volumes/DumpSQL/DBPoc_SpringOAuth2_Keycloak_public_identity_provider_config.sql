create table identity_provider_config
(
    identity_provider_id varchar(36)  not null
        constraint fkdc4897cf864c4e43
            references identity_provider,
    value                text,
    name                 varchar(255) not null,
    constraint constraint_d
        primary key (identity_provider_id, name)
);

alter table identity_provider_config
    owner to dbamaster01;

grant select on identity_provider_config to replicator;

