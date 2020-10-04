create table offline_client_session
(
    user_session_id         varchar(36)                                     not null,
    client_id               varchar(255)                                    not null,
    offline_flag            varchar(4)                                      not null,
    timestamp               integer,
    data                    text,
    client_storage_provider varchar(36)  default 'local'::character varying not null,
    external_client_id      varchar(255) default 'local'::character varying not null,
    constraint constraint_offl_cl_ses_pk3
        primary key (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag)
);

alter table offline_client_session
    owner to dbamaster01;

grant select on offline_client_session to replicator;

create index idx_us_sess_id_on_cl_sess
    on offline_client_session (user_session_id);

