create table policy_config
(
    policy_id varchar(36)  not null
        constraint fkdc34197cf864c4e43
            references resource_server_policy,
    name      varchar(255) not null,
    value     text,
    constraint constraint_dpc
        primary key (policy_id, name)
);

alter table policy_config
    owner to dbamaster01;

grant select on policy_config to replicator;

INSERT INTO public.policy_config (policy_id, name, value) VALUES ('474663d9-fd0b-472f-be43-174cec89167b', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config (policy_id, name, value) VALUES ('f8f18532-afdb-42bb-9b0f-62a9ae0e560c', 'defaultResourceType', 'urn:PoC-Soki-App-Client-01:resources:default');