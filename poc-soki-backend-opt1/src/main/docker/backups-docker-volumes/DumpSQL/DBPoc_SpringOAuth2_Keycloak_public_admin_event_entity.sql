create table admin_event_entity
(
    id               varchar(36) not null
        constraint constraint_admin_event_entity
            primary key,
    admin_event_time bigint,
    realm_id         varchar(255),
    operation_type   varchar(255),
    auth_realm_id    varchar(255),
    auth_client_id   varchar(255),
    auth_user_id     varchar(255),
    ip_address       varchar(255),
    resource_path    varchar(2550),
    representation   text,
    error            varchar(255),
    resource_type    varchar(64)
);

alter table admin_event_entity
    owner to dbamaster01;

grant select on admin_event_entity to replicator;

