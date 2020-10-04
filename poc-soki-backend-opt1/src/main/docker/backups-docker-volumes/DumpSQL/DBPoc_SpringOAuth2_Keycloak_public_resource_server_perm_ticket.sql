create table resource_server_perm_ticket
(
    id                 varchar(36)  not null
        constraint constraint_fapmt
            primary key,
    owner              varchar(255) not null,
    requester          varchar(255) not null,
    created_timestamp  bigint       not null,
    granted_timestamp  bigint,
    resource_id        varchar(36)  not null
        constraint fk_frsrho213xcx4wnkog83sspmt
            references resource_server_resource,
    scope_id           varchar(36)
        constraint fk_frsrho213xcx4wnkog84sspmt
            references resource_server_scope,
    resource_server_id varchar(36)  not null
        constraint fk_frsrho213xcx4wnkog82sspmt
            references resource_server,
    policy_id          varchar(36)
        constraint fk_frsrpo2128cx4wnkog82ssrfy
            references resource_server_policy,
    constraint uk_frsr6t700s9v50bu18ws5pmt
        unique (owner, requester, resource_server_id, resource_id, scope_id)
);

alter table resource_server_perm_ticket
    owner to dbamaster01;

grant select on resource_server_perm_ticket to replicator;

