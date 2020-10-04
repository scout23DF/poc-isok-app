create table group_role_mapping
(
    role_id  varchar(36) not null
        constraint fk_group_role_role
            references keycloak_role,
    group_id varchar(36) not null
        constraint fk_group_role_group
            references keycloak_group,
    constraint constraint_group_role
        primary key (role_id, group_id)
);

alter table group_role_mapping
    owner to dbamaster01;

grant select on group_role_mapping to replicator;

create index idx_group_role_mapp_group
    on group_role_mapping (group_id);

