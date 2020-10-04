create table client_scope_attributes
(
    scope_id varchar(36)  not null
        constraint fk_cl_scope_attr_scope
            references client_scope,
    value    varchar(2048),
    name     varchar(255) not null,
    constraint pk_cl_tmpl_attr
        primary key (scope_id, name)
);

alter table client_scope_attributes
    owner to dbamaster01;

grant select on client_scope_attributes to replicator;

create index idx_clscope_attrs
    on client_scope_attributes (scope_id);

INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('700b4f56-7e63-40a5-bf6f-0a978279b2f0', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('700b4f56-7e63-40a5-bf6f-0a978279b2f0', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b8cf8179-455c-4dce-a32f-335744d3b704', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b8cf8179-455c-4dce-a32f-335744d3b704', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b8cf8179-455c-4dce-a32f-335744d3b704', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c84ea01-a6b6-42f3-a8ba-aec260c86634', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c84ea01-a6b6-42f3-a8ba-aec260c86634', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0c84ea01-a6b6-42f3-a8ba-aec260c86634', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e6d4c1e6-036f-4018-9609-a0e205a4a507', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e6d4c1e6-036f-4018-9609-a0e205a4a507', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e6d4c1e6-036f-4018-9609-a0e205a4a507', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('941518b6-63f2-4912-8cc5-7b45a0b90d40', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('941518b6-63f2-4912-8cc5-7b45a0b90d40', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('941518b6-63f2-4912-8cc5-7b45a0b90d40', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b786157b-6a00-4d21-8394-68404975701f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b786157b-6a00-4d21-8394-68404975701f', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b786157b-6a00-4d21-8394-68404975701f', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('17d991f7-11aa-41d6-87e8-8a5ad30923a8', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('17d991f7-11aa-41d6-87e8-8a5ad30923a8', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('be6e0330-f101-456c-9dc8-bb2770104a01', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('be6e0330-f101-456c-9dc8-bb2770104a01', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('2ea32f36-8a2d-4565-8000-267954d1b466', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('2ea32f36-8a2d-4565-8000-267954d1b466', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8358ec8f-e794-451a-b3e9-e1a99664992f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8358ec8f-e794-451a-b3e9-e1a99664992f', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('8358ec8f-e794-451a-b3e9-e1a99664992f', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3171e3d6-69ba-4732-8815-bf279b192da5', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3171e3d6-69ba-4732-8815-bf279b192da5', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3171e3d6-69ba-4732-8815-bf279b192da5', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('644b2967-63ed-4559-a91c-dc65b8b1de55', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('644b2967-63ed-4559-a91c-dc65b8b1de55', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('644b2967-63ed-4559-a91c-dc65b8b1de55', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('92f27ece-595a-497d-a8a4-d7d5d94a44d9', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('92f27ece-595a-497d-a8a4-d7d5d94a44d9', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('92f27ece-595a-497d-a8a4-d7d5d94a44d9', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1af671a3-3e34-4044-bcce-932600fbe78b', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1af671a3-3e34-4044-bcce-932600fbe78b', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1af671a3-3e34-4044-bcce-932600fbe78b', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d59ffc54-01fb-4cd2-8668-885d7846c3fe', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d59ffc54-01fb-4cd2-8668-885d7846c3fe', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('d59ffc54-01fb-4cd2-8668-885d7846c3fe', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('abbf3a3a-e7e3-4095-8143-361e788921e4', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('abbf3a3a-e7e3-4095-8143-361e788921e4', 'true', 'include.in.token.scope');