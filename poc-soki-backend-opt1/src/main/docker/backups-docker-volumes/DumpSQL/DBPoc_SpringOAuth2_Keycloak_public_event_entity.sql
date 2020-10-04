create table event_entity
(
    id           varchar(36) not null
        constraint constraint_4
            primary key,
    client_id    varchar(255),
    details_json varchar(2550),
    error        varchar(255),
    ip_address   varchar(255),
    realm_id     varchar(255),
    session_id   varchar(255),
    event_time   bigint,
    type         varchar(255),
    user_id      varchar(255)
);

alter table event_entity
    owner to dbamaster01;

grant select on event_entity to replicator;

create index idx_event_time
    on event_entity (realm_id, event_time);

