create table resource_server
(
    id                   varchar(36)            not null
        constraint pk_resource_server
            primary key,
    allow_rs_remote_mgmt boolean  default false not null,
    policy_enforce_mode  varchar(15)            not null,
    decision_strategy    smallint default 1     not null
);

alter table resource_server
    owner to dbamaster01;

grant select on resource_server to replicator;

INSERT INTO public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', true, '0', 1);