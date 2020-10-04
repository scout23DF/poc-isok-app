create table realm_default_roles
(
    realm_id varchar(36) not null
        constraint fk_evudb1ppw84oxfax2drs03icc
            references realm,
    role_id  varchar(36) not null
        constraint uk_h4wpd7w4hsoolni3h0sw7btje
            unique
        constraint fk_h4wpd7w4hsoolni3h0sw7btje
            references keycloak_role,
    constraint constraint_realm_default_roles
        primary key (realm_id, role_id)
);

alter table realm_default_roles
    owner to dbamaster01;

grant select on realm_default_roles to replicator;

create index idx_realm_def_roles_realm
    on realm_default_roles (realm_id);

INSERT INTO public.realm_default_roles (realm_id, role_id) VALUES ('master', '8f628a3e-3a1d-41b6-8a4c-ef418e2f01b6');
INSERT INTO public.realm_default_roles (realm_id, role_id) VALUES ('master', '1555f57b-d48a-4ac2-8064-16f203efc559');
INSERT INTO public.realm_default_roles (realm_id, role_id) VALUES ('PoC-Soki-Realm-01', '68465770-630c-4aa4-98a4-63a810c7aa91');
INSERT INTO public.realm_default_roles (realm_id, role_id) VALUES ('PoC-Soki-Realm-01', '94f68f32-df10-4d4c-aa0c-f06fea1327d8');