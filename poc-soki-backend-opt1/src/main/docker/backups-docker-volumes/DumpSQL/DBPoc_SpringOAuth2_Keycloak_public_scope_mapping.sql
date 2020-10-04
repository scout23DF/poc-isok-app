create table scope_mapping
(
    client_id varchar(36) not null
        constraint fk_ouse064plmlr732lxjcn1q5f1
            references client,
    role_id   varchar(36) not null
        constraint fk_p3rh9grku11kqfrs4fltt7rnq
            references keycloak_role,
    constraint constraint_81
        primary key (client_id, role_id)
);

alter table scope_mapping
    owner to dbamaster01;

grant select on scope_mapping to replicator;

create index idx_scope_mapping_role
    on scope_mapping (role_id);

INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'c441ff20-25c7-4c70-88e6-431925120e72');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', 'cd6ee10f-e970-4684-bfb5-4852ab788461');