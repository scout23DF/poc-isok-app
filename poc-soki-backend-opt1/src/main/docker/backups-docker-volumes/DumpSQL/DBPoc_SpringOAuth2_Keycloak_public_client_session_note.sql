create table client_session_note
(
    name           varchar(255) not null,
    value          varchar(255),
    client_session varchar(36)  not null
        constraint fk5edfb00ff51c2736
            references client_session,
    constraint constraint_5e
        primary key (client_session, name)
);

alter table client_session_note
    owner to dbamaster01;

grant select on client_session_note to replicator;

