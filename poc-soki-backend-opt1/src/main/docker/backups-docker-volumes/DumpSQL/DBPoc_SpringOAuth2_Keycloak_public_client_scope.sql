create table client_scope
(
    id          varchar(36) not null
        constraint pk_cli_template
            primary key,
    name        varchar(255),
    realm_id    varchar(36)
        constraint fk_realm_cli_scope
            references realm,
    description varchar(255),
    protocol    varchar(255),
    constraint uk_cli_scope
        unique (realm_id, name)
);

alter table client_scope
    owner to dbamaster01;

grant select on client_scope to replicator;

create index idx_realm_clscope
    on client_scope (realm_id);

INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('700b4f56-7e63-40a5-bf6f-0a978279b2f0', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('b8cf8179-455c-4dce-a32f-335744d3b704', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('0c84ea01-a6b6-42f3-a8ba-aec260c86634', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('e6d4c1e6-036f-4018-9609-a0e205a4a507', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('941518b6-63f2-4912-8cc5-7b45a0b90d40', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('b786157b-6a00-4d21-8394-68404975701f', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('17d991f7-11aa-41d6-87e8-8a5ad30923a8', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('be6e0330-f101-456c-9dc8-bb2770104a01', 'offline_access', 'PoC-Soki-Realm-01', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('2ea32f36-8a2d-4565-8000-267954d1b466', 'role_list', 'PoC-Soki-Realm-01', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('8358ec8f-e794-451a-b3e9-e1a99664992f', 'profile', 'PoC-Soki-Realm-01', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('3171e3d6-69ba-4732-8815-bf279b192da5', 'email', 'PoC-Soki-Realm-01', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('644b2967-63ed-4559-a91c-dc65b8b1de55', 'address', 'PoC-Soki-Realm-01', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('92f27ece-595a-497d-a8a4-d7d5d94a44d9', 'phone', 'PoC-Soki-Realm-01', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('1af671a3-3e34-4044-bcce-932600fbe78b', 'roles', 'PoC-Soki-Realm-01', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('d59ffc54-01fb-4cd2-8668-885d7846c3fe', 'web-origins', 'PoC-Soki-Realm-01', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('abbf3a3a-e7e3-4095-8143-361e788921e4', 'microprofile-jwt', 'PoC-Soki-Realm-01', 'Microprofile - JWT built-in scope', 'openid-connect');