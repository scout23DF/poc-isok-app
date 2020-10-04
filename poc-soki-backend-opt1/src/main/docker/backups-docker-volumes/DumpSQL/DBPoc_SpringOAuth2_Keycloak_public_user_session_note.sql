create table user_session_note
(
    user_session varchar(36)  not null
        constraint fk5edfb00ff51d3472
            references user_session,
    name         varchar(255) not null,
    value        varchar(2048),
    constraint constraint_usn_pk
        primary key (user_session, name)
);

alter table user_session_note
    owner to dbamaster01;

grant select on user_session_note to replicator;

