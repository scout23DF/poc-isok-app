create table realm_smtp_config
(
    realm_id varchar(36)  not null
        constraint fk_70ej8xdxgxd0b9hh6180irr0o
            references realm,
    value    varchar(255),
    name     varchar(255) not null,
    constraint constraint_e
        primary key (realm_id, name)
);

alter table realm_smtp_config
    owner to dbamaster01;

grant select on realm_smtp_config to replicator;

