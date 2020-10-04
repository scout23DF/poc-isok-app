create table federated_identity
(
    identity_provider  varchar(255) not null,
    realm_id           varchar(36),
    federated_user_id  varchar(255),
    federated_username varchar(255),
    token              text,
    user_id            varchar(36)  not null
        constraint fk404288b92ef007a6
            references user_entity,
    constraint constraint_40
        primary key (identity_provider, user_id)
);

alter table federated_identity
    owner to dbamaster01;

grant select on federated_identity to replicator;

create index idx_fedidentity_user
    on federated_identity (user_id);

create index idx_fedidentity_feduser
    on federated_identity (federated_user_id);

