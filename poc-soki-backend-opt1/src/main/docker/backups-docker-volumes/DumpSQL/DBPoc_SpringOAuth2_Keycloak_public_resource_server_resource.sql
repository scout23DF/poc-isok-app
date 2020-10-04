create table resource_server_resource
(
    id                   varchar(36)           not null
        constraint constraint_farsr
            primary key,
    name                 varchar(255)          not null,
    type                 varchar(255),
    icon_uri             varchar(255),
    owner                varchar(255)          not null,
    resource_server_id   varchar(36)           not null
        constraint fk_frsrho213xcx4wnkog82ssrfy
            references resource_server,
    owner_managed_access boolean default false not null,
    display_name         varchar(255),
    constraint uk_frsr6t700s9v50bu18ws5ha6
        unique (name, owner, resource_server_id)
);

alter table resource_server_resource
    owner to dbamaster01;

grant select on resource_server_resource to replicator;

create index idx_res_srv_res_res_srv
    on resource_server_resource (resource_server_id);

INSERT INTO public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) VALUES ('9c255e49-9189-46e5-949e-f97637a9e9c8', 'Default Resource', 'urn:PoC-Soki-App-Client-01:resources:default', null, '5067ce51-37f0-46a5-bfa2-984543e80361', '5067ce51-37f0-46a5-bfa2-984543e80361', false, null);