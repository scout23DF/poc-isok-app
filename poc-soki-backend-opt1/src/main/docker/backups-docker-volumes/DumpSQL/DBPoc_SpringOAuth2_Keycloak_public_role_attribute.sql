create table role_attribute
(
    id      varchar(36)  not null
        constraint constraint_role_attribute_pk
            primary key,
    role_id varchar(36)  not null
        constraint fk_role_attribute_id
            references keycloak_role,
    name    varchar(255) not null,
    value   varchar(255)
);

alter table role_attribute
    owner to dbamaster01;

grant select on role_attribute to replicator;

create index idx_role_attribute
    on role_attribute (role_id);

