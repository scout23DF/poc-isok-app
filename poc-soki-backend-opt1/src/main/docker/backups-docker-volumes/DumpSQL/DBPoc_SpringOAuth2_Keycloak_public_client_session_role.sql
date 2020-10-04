create table client_session_role
(
    role_id        varchar(255) not null,
    client_session varchar(36)  not null
        constraint fk_11b7sgqw18i532811v7o2dv76
            references client_session,
    constraint constraint_5
        primary key (client_session, role_id)
);

alter table client_session_role
    owner to dbamaster01;

grant select on client_session_role to replicator;

