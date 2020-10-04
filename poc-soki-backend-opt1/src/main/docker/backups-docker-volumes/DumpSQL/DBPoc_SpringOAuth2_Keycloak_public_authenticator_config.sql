create table authenticator_config
(
    id       varchar(36) not null
        constraint constraint_auth_pk
            primary key,
    alias    varchar(255),
    realm_id varchar(36)
        constraint fk_auth_realm
            references realm
);

alter table authenticator_config
    owner to dbamaster01;

grant select on authenticator_config to replicator;

create index idx_auth_config_realm
    on authenticator_config (realm_id);

INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('c8e6aecf-e441-405d-a898-f6cb4d8b6bdd', 'review profile config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('3aa102b0-10b3-4bcb-a9d8-029b1e3d3d85', 'create unique user config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('de39db2e-1248-4964-a164-5228cb2b0756', 'review profile config', 'PoC-Soki-Realm-01');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('8ebbc1be-64d0-486f-ae49-a05cf3a4aff5', 'create unique user config', 'PoC-Soki-Realm-01');