create table group_attribute
(
    id       varchar(36) default 'sybase-needs-something-here'::character varying not null
        constraint constraint_group_attribute_pk
            primary key,
    name     varchar(255)                                                         not null,
    value    varchar(255),
    group_id varchar(36)                                                          not null
        constraint fk_group_attribute_group
            references keycloak_group
);

alter table group_attribute
    owner to dbamaster01;

grant select on group_attribute to replicator;

create index idx_group_attr_group
    on group_attribute (group_id);

