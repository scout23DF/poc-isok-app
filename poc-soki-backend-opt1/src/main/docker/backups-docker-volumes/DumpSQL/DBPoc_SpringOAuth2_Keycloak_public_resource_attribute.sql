create table resource_attribute
(
    id          varchar(36) default 'sybase-needs-something-here'::character varying not null
        constraint res_attr_pk
            primary key,
    name        varchar(255)                                                         not null,
    value       varchar(255),
    resource_id varchar(36)                                                          not null
        constraint fk_5hrm2vlf9ql5fu022kqepovbr
            references resource_server_resource
);

alter table resource_attribute
    owner to dbamaster01;

grant select on resource_attribute to replicator;

