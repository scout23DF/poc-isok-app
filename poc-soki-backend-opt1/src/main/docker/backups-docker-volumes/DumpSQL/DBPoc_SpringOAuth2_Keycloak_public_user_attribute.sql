create table user_attribute
(
    name    varchar(255)                                                         not null,
    value   varchar(255),
    user_id varchar(36)                                                          not null
        constraint fk_5hrm2vlf9ql5fu043kqepovbr
            references user_entity,
    id      varchar(36) default 'sybase-needs-something-here'::character varying not null
        constraint constraint_user_attribute_pk
            primary key
);

alter table user_attribute
    owner to dbamaster01;

grant select on user_attribute to replicator;

create index idx_user_attribute
    on user_attribute (user_id);

