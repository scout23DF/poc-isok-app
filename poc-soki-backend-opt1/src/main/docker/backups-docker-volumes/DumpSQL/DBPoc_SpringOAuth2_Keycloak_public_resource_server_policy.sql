create table resource_server_policy
(
    id                 varchar(36)  not null
        constraint constraint_farsrp
            primary key,
    name               varchar(255) not null,
    description        varchar(255),
    type               varchar(255) not null,
    decision_strategy  varchar(20),
    logic              varchar(20),
    resource_server_id varchar(36)  not null
        constraint fk_frsrpo213xcx4wnkog82ssrfy
            references resource_server,
    owner              varchar(255),
    constraint uk_frsrpt700s9v50bu18ws5ha6
        unique (name, resource_server_id)
);

alter table resource_server_policy
    owner to dbamaster01;

grant select on resource_server_policy to replicator;

create index idx_res_serv_pol_res_serv
    on resource_server_policy (resource_server_id);

INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('474663d9-fd0b-472f-be43-174cec89167b', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '5067ce51-37f0-46a5-bfa2-984543e80361', null);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('f8f18532-afdb-42bb-9b0f-62a9ae0e560c', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '5067ce51-37f0-46a5-bfa2-984543e80361', null);