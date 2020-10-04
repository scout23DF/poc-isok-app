create table user_session
(
    id                   varchar(36)           not null
        constraint constraint_57
            primary key,
    auth_method          varchar(255),
    ip_address           varchar(255),
    last_session_refresh integer,
    login_username       varchar(255),
    realm_id             varchar(255),
    remember_me          boolean default false not null,
    started              integer,
    user_id              varchar(255),
    user_session_state   integer,
    broker_session_id    varchar(255),
    broker_user_id       varchar(255)
);

alter table user_session
    owner to dbamaster01;

grant select on user_session to replicator;

