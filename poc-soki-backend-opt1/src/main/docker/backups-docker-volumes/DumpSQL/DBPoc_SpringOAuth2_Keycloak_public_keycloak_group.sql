create table keycloak_group
(
    id           varchar(36) not null
        constraint constraint_group
            primary key,
    name         varchar(255),
    parent_group varchar(36) not null,
    realm_id     varchar(36)
        constraint fk_group_realm
            references realm,
    constraint sibling_names
        unique (realm_id, parent_group, name)
);

alter table keycloak_group
    owner to dbamaster01;

grant select on keycloak_group to replicator;

