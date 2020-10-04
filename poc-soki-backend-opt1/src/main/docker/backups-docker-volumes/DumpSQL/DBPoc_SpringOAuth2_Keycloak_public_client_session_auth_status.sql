create table client_session_auth_status
(
    authenticator  varchar(36) not null,
    status         integer,
    client_session varchar(36) not null
        constraint auth_status_constraint
            references client_session,
    constraint constraint_auth_status_pk
        primary key (client_session, authenticator)
);

alter table client_session_auth_status
    owner to dbamaster01;

grant select on client_session_auth_status to replicator;

