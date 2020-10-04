create table resource_scope
(
    resource_id varchar(36) not null
        constraint fk_frsrpos13xcx4wnkog82ssrfy
            references resource_server_resource,
    scope_id    varchar(36) not null
        constraint fk_frsrps213xcx4wnkog82ssrfy
            references resource_server_scope,
    constraint constraint_farsrsp
        primary key (resource_id, scope_id)
);

alter table resource_scope
    owner to dbamaster01;

grant select on resource_scope to replicator;

create index idx_res_scope_scope
    on resource_scope (scope_id);

