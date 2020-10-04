create table resource_server_scope
(
    id                 varchar(36)  not null
        constraint constraint_farsrs
            primary key,
    name               varchar(255) not null,
    icon_uri           varchar(255),
    resource_server_id varchar(36)  not null
        constraint fk_frsrso213xcx4wnkog82ssrfy
            references resource_server,
    display_name       varchar(255),
    constraint uk_frsrst700s9v50bu18ws5ha6
        unique (name, resource_server_id)
);

alter table resource_server_scope
    owner to dbamaster01;

grant select on resource_server_scope to replicator;

create index idx_res_srv_scope_res_srv
    on resource_server_scope (resource_server_id);

