create table user_consent
(
    id                      varchar(36) not null
        constraint constraint_grntcsnt_pm
            primary key,
    client_id               varchar(255),
    user_id                 varchar(36) not null
        constraint fk_grntcsnt_user
            references user_entity,
    created_date            bigint,
    last_updated_date       bigint,
    client_storage_provider varchar(36),
    external_client_id      varchar(255),
    constraint uk_jkuwuvd56ontgsuhogm8uewrt
        unique (client_id, client_storage_provider, external_client_id, user_id)
);

alter table user_consent
    owner to dbamaster01;

grant select on user_consent to replicator;

create index idx_user_consent
    on user_consent (user_id);

