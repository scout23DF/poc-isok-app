create table scope_policy
(
    scope_id  varchar(36) not null
        constraint fk_frsrpass3xcx4wnkog82ssrfy
            references resource_server_scope,
    policy_id varchar(36) not null
        constraint fk_frsrasp13xcx4wnkog82ssrfy
            references resource_server_policy,
    constraint constraint_farsrsps
        primary key (scope_id, policy_id)
);

alter table scope_policy
    owner to dbamaster01;

grant select on scope_policy to replicator;

create index idx_scope_policy_policy
    on scope_policy (policy_id);

