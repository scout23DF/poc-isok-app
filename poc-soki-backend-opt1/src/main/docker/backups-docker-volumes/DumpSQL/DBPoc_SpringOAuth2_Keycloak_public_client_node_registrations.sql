create table client_node_registrations
(
    client_id varchar(36)  not null
        constraint fk4129723ba992f594
            references client,
    value     integer,
    name      varchar(255) not null,
    constraint constraint_84
        primary key (client_id, name)
);

alter table client_node_registrations
    owner to dbamaster01;

grant select on client_node_registrations to replicator;

