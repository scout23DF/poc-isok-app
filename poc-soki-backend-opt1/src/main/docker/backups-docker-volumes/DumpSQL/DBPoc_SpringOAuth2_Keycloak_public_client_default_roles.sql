create table client_default_roles
(
    client_id varchar(36) not null
        constraint fk_nuilts7klwqw2h8m2b5joytky
            references client,
    role_id   varchar(36) not null
        constraint uk_8aelwnibji49avxsrtuf6xjow
            unique
        constraint fk_8aelwnibji49avxsrtuf6xjow
            references keycloak_role,
    constraint constr_client_default_roles
        primary key (client_id, role_id)
);

alter table client_default_roles
    owner to dbamaster01;

grant select on client_default_roles to replicator;

create index idx_client_def_roles_client
    on client_default_roles (client_id);

INSERT INTO public.client_default_roles (client_id, role_id) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '5325dae2-4ad5-4519-bf07-f43721c3896c');
INSERT INTO public.client_default_roles (client_id, role_id) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', 'c441ff20-25c7-4c70-88e6-431925120e72');
INSERT INTO public.client_default_roles (client_id, role_id) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', 'b284cb80-aba0-4511-bc09-415b47ea7280');
INSERT INTO public.client_default_roles (client_id, role_id) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', 'cd6ee10f-e970-4684-bfb5-4852ab788461');