create table client_initial_access
(
    id              varchar(36) not null
        constraint cnstr_client_init_acc_pk
            primary key,
    realm_id        varchar(36) not null
        constraint fk_client_init_acc_realm
            references realm,
    timestamp       integer,
    expiration      integer,
    count           integer,
    remaining_count integer
);

alter table client_initial_access
    owner to dbamaster01;

grant select on client_initial_access to replicator;

create index idx_client_init_acc_realm
    on client_initial_access (realm_id);

