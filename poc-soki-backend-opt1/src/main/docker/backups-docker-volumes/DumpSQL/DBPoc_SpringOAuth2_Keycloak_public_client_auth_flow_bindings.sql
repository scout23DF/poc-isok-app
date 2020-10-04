create table client_auth_flow_bindings
(
    client_id    varchar(36)  not null,
    flow_id      varchar(36),
    binding_name varchar(255) not null,
    constraint c_cli_flow_bind
        primary key (client_id, binding_name)
);

alter table client_auth_flow_bindings
    owner to dbamaster01;

grant select on client_auth_flow_bindings to replicator;

