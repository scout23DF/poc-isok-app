create table associated_policy
(
    policy_id            varchar(36) not null
        constraint fk_frsrpas14xcx4wnkog82ssrfy
            references resource_server_policy,
    associated_policy_id varchar(36) not null
        constraint fk_frsr5s213xcx4wnkog82ssrfy
            references resource_server_policy,
    constraint constraint_farsrpap
        primary key (policy_id, associated_policy_id)
);

alter table associated_policy
    owner to dbamaster01;

grant select on associated_policy to replicator;

create index idx_assoc_pol_assoc_pol_id
    on associated_policy (associated_policy_id);

INSERT INTO public.associated_policy (policy_id, associated_policy_id) VALUES ('f8f18532-afdb-42bb-9b0f-62a9ae0e560c', '474663d9-fd0b-472f-be43-174cec89167b');