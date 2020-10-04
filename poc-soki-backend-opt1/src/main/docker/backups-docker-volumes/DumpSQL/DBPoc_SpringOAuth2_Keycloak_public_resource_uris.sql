create table resource_uris
(
    resource_id varchar(36)  not null
        constraint fk_resource_server_uris
            references resource_server_resource,
    value       varchar(255) not null,
    constraint constraint_resour_uris_pk
        primary key (resource_id, value)
);

alter table resource_uris
    owner to dbamaster01;

grant select on resource_uris to replicator;

INSERT INTO public.resource_uris (resource_id, value) VALUES ('9c255e49-9189-46e5-949e-f97637a9e9c8', '/*');