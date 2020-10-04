create table client_scope_role_mapping
(
    scope_id varchar(36) not null
        constraint fk_cl_scope_rm_scope
            references client_scope,
    role_id  varchar(36) not null
        constraint fk_cl_scope_rm_role
            references keycloak_role,
    constraint pk_template_scope
        primary key (scope_id, role_id)
);

alter table client_scope_role_mapping
    owner to dbamaster01;

grant select on client_scope_role_mapping to replicator;

create index idx_clscope_role
    on client_scope_role_mapping (scope_id);

create index idx_role_clscope
    on client_scope_role_mapping (role_id);

INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('700b4f56-7e63-40a5-bf6f-0a978279b2f0', '8f628a3e-3a1d-41b6-8a4c-ef418e2f01b6');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('be6e0330-f101-456c-9dc8-bb2770104a01', '68465770-630c-4aa4-98a4-63a810c7aa91');