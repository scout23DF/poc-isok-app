create table resource_policy
(
    resource_id varchar(36) not null
        constraint fk_frsrpos53xcx4wnkog82ssrfy
            references resource_server_resource,
    policy_id   varchar(36) not null
        constraint fk_frsrpp213xcx4wnkog82ssrfy
            references resource_server_policy,
    constraint constraint_farsrpp
        primary key (resource_id, policy_id)
);

alter table resource_policy
    owner to dbamaster01;

grant select on resource_policy to replicator;

create index idx_res_policy_policy
    on resource_policy (policy_id);

