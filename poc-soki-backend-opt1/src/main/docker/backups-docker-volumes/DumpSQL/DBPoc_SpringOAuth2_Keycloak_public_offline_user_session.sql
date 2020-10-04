create table offline_user_session
(
    user_session_id      varchar(36)       not null,
    user_id              varchar(255)      not null,
    realm_id             varchar(36)       not null,
    created_on           integer           not null,
    offline_flag         varchar(4)        not null,
    data                 text,
    last_session_refresh integer default 0 not null,
    constraint constraint_offl_us_ses_pk2
        primary key (user_session_id, offline_flag)
);

alter table offline_user_session
    owner to dbamaster01;

grant select on offline_user_session to replicator;

create index idx_offline_uss_createdon
    on offline_user_session (created_on);

