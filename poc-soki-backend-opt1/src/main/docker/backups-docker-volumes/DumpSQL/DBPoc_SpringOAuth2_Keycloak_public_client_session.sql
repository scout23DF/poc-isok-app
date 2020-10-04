create table client_session
(
    id             varchar(36) not null
        constraint constraint_8
            primary key,
    client_id      varchar(36),
    redirect_uri   varchar(255),
    state          varchar(255),
    timestamp      integer,
    session_id     varchar(36)
        constraint fk_b4ao2vcvat6ukau74wbwtfqo1
            references user_session,
    auth_method    varchar(255),
    realm_id       varchar(255),
    auth_user_id   varchar(36),
    current_action varchar(36)
);

alter table client_session
    owner to dbamaster01;

grant select on client_session to replicator;

create index idx_client_session_session
    on client_session (session_id);

