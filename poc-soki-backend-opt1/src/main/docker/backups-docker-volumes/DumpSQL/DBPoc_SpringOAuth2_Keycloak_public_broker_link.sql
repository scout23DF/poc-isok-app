create table broker_link
(
    identity_provider   varchar(255) not null,
    storage_provider_id varchar(255),
    realm_id            varchar(36)  not null,
    broker_user_id      varchar(255),
    broker_username     varchar(255),
    token               text,
    user_id             varchar(255) not null,
    constraint constr_broker_link_pk
        primary key (identity_provider, user_id)
);

alter table broker_link
    owner to dbamaster01;

grant select on broker_link to replicator;

