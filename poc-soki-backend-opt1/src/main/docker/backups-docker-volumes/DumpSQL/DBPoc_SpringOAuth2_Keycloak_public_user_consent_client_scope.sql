create table user_consent_client_scope
(
    user_consent_id varchar(36) not null
        constraint fk_grntcsnt_clsc_usc
            references user_consent,
    scope_id        varchar(36) not null,
    constraint constraint_grntcsnt_clsc_pm
        primary key (user_consent_id, scope_id)
);

alter table user_consent_client_scope
    owner to dbamaster01;

grant select on user_consent_client_scope to replicator;

create index idx_usconsent_clscope
    on user_consent_client_scope (user_consent_id);

