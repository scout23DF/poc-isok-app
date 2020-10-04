create table default_client_scope
(
    realm_id      varchar(36)           not null
        constraint fk_r_def_cli_scope_realm
            references realm,
    scope_id      varchar(36)           not null
        constraint fk_r_def_cli_scope_scope
            references client_scope,
    default_scope boolean default false not null,
    constraint r_def_cli_scope_bind
        primary key (realm_id, scope_id)
);

alter table default_client_scope
    owner to dbamaster01;

grant select on default_client_scope to replicator;

create index idx_defcls_realm
    on default_client_scope (realm_id);

create index idx_defcls_scope
    on default_client_scope (scope_id);

INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('PoC-Soki-Realm-01', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);