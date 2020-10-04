create table fed_user_consent_cl_scope
(
    user_consent_id varchar(36) not null,
    scope_id        varchar(36) not null,
    constraint constraint_fgrntcsnt_clsc_pm
        primary key (user_consent_id, scope_id)
);

alter table fed_user_consent_cl_scope
    owner to dbamaster01;

grant select on fed_user_consent_cl_scope to replicator;

