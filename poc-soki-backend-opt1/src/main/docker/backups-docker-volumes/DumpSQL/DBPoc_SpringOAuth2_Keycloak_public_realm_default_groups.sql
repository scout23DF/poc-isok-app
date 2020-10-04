create table realm_default_groups
(
    realm_id varchar(36) not null
        constraint fk_def_groups_realm
            references realm,
    group_id varchar(36) not null
        constraint con_group_id_def_groups
            unique
        constraint fk_def_groups_group
            references keycloak_group,
    constraint constr_realm_default_groups
        primary key (realm_id, group_id)
);

alter table realm_default_groups
    owner to dbamaster01;

grant select on realm_default_groups to replicator;

create index idx_realm_def_grp_realm
    on realm_default_groups (realm_id);

