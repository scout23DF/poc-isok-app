create table federated_user
(
    id                  varchar(255) not null
        constraint constr_federated_user
            primary key,
    storage_provider_id varchar(255),
    realm_id            varchar(36)  not null
);

alter table federated_user
    owner to dbamaster01;

grant select on federated_user to replicator;

