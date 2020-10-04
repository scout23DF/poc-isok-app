create table client_user_session_note
(
    name           varchar(255) not null,
    value          varchar(2048),
    client_session varchar(36)  not null
        constraint fk_cl_usr_ses_note
            references client_session,
    constraint constr_cl_usr_ses_note
        primary key (client_session, name)
);

alter table client_user_session_note
    owner to dbamaster01;

grant select on client_user_session_note to replicator;

