create table protocol_mapper
(
    id                   varchar(36)  not null
        constraint constraint_pcm
            primary key,
    name                 varchar(255) not null,
    protocol             varchar(255) not null,
    protocol_mapper_name varchar(255) not null,
    client_id            varchar(36)
        constraint fk_pcm_realm
            references client,
    client_scope_id      varchar(36)
        constraint fk_cli_scope_mapper
            references client_scope
);

alter table protocol_mapper
    owner to dbamaster01;

grant select on protocol_mapper to replicator;

create index idx_protocol_mapper_client
    on protocol_mapper (client_id);

create index idx_clscope_protmap
    on protocol_mapper (client_scope_id);

INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1ded491e-1993-417c-a6a5-67f76f5662dd', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e9032bde-be71-4b07-989e-2a888d4f65c2', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '0acb1dc9-e951-4a48-8581-9436e7da12cc', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8cc03dd3-fd8f-46c4-baac-d6139474ebd9', 'role list', 'saml', 'saml-role-list-mapper', null, '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0f0b18b4-f130-4be3-bd9f-c2224f20f624', 'full name', 'openid-connect', 'oidc-full-name-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a94f9d7b-5d64-4876-8fe0-d9d344231dba', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fbd083cf-b9d3-460c-97e2-4fcdc8af34e9', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fd74327e-c067-43c4-9be8-86987830aecd', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('aa0134ea-0864-442e-9c87-9a99e6a21c82', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('eb2fa6b6-c786-4602-98f8-7620a4fb6083', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('28e01b60-e774-4550-afeb-05039ab2dc3c', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('850f0039-202d-4b03-abab-78c238db6929', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fe114d94-90b5-4222-a0d9-291f89f2ddc1', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5345954d-0623-4432-b0d6-e27f785a9732', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b8238408-1d16-4299-bd8f-c840e3b56ed8', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ee0018ac-c3aa-434e-a5ad-e45af799f5f2', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('cd2d74bf-2d64-472b-a146-2733de5409d0', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('75ca7f6a-208f-443c-945e-fe1d9ccc23a7', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, 'b8cf8179-455c-4dce-a32f-335744d3b704');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1d2794aa-32ec-4265-8a88-3d057d005ad4', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', null, '0c84ea01-a6b6-42f3-a8ba-aec260c86634');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('bdef6b6d-8cd5-4cde-bd7b-1dbe0d8b44c1', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', null, '0c84ea01-a6b6-42f3-a8ba-aec260c86634');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0089ba07-2b33-4643-8189-4903d366ad0b', 'address', 'openid-connect', 'oidc-address-mapper', null, 'e6d4c1e6-036f-4018-9609-a0e205a4a507');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('902d32ce-5815-4f56-8357-71a3cb9b9c3d', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '941518b6-63f2-4912-8cc5-7b45a0b90d40');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2a32ffcf-bf22-4b33-bc91-e94e6223c445', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '941518b6-63f2-4912-8cc5-7b45a0b90d40');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c06c974b-0706-4324-95f7-04a73cab9729', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', null, 'b786157b-6a00-4d21-8394-68404975701f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7e4e99cd-3931-45c8-a305-e3af4363efd5', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', null, 'b786157b-6a00-4d21-8394-68404975701f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('6a376bbb-84a1-4ec8-969b-7bc2fb1f802a', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', null, 'b786157b-6a00-4d21-8394-68404975701f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2c835171-311e-45d4-b08a-0114d2821d2a', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', null, 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9027200a-3c6c-47da-947e-18450756b4f2', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', null, '17d991f7-11aa-41d6-87e8-8a5ad30923a8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2fefbff1-eb5c-4e89-ae3f-a9c73bf2796e', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', null, '17d991f7-11aa-41d6-87e8-8a5ad30923a8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9eb055b2-1a84-4c40-8a88-e222f4f279d4', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '95a91113-a1ca-48e9-a0e7-5320c3f6422a', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('745f98b5-0d12-4e5f-8113-f75035871219', 'role list', 'saml', 'saml-role-list-mapper', null, '2ea32f36-8a2d-4565-8000-267954d1b466');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('e06d8adb-eb87-4146-a6e0-4de30bb74df4', 'full name', 'openid-connect', 'oidc-full-name-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('937a83d4-56bd-46ef-b68f-09291a89715d', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('910be649-fd43-40c7-8dee-746ba219c82d', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1a1c52d8-1311-4772-9994-125b157be35c', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9a55e044-9247-4a40-a9d6-d55bae0d9031', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3d7932f6-2881-4f5a-ba9c-aa5868899172', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('be8038c0-570d-47d2-af1b-17c80f45eeb3', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3904c811-6552-4dd6-b12d-db6b5822b488', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('291e0b75-18e7-4578-92d1-826a0d61d8cd', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('503f9f4f-a309-4c79-9171-ac2a8169e374', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4449abe4-0fcc-4f99-8463-a14b56edc43a', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('666abaae-f6f0-44e2-bad9-e840b0503f70', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b3b3d43d-eb5c-43ab-811b-b44307d908e8', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('be077cfe-925a-4c05-ab46-96b02e55e1a7', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '8358ec8f-e794-451a-b3e9-e1a99664992f');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('cb6d7049-6607-470a-b682-e6479501edce', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', null, '3171e3d6-69ba-4732-8815-bf279b192da5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b01b6c00-4901-44b1-a5b5-aab15c165cd2', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', null, '3171e3d6-69ba-4732-8815-bf279b192da5');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4c013504-9678-41da-b831-f27031a9f12b', 'address', 'openid-connect', 'oidc-address-mapper', null, '644b2967-63ed-4559-a91c-dc65b8b1de55');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('80965ceb-a59b-4522-8d81-8e1161d0b80c', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '92f27ece-595a-497d-a8a4-d7d5d94a44d9');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c5e09de1-4841-457f-889c-81f5808c23bb', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', null, '92f27ece-595a-497d-a8a4-d7d5d94a44d9');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('d3ce9a75-369a-4200-a75c-43fec05f44df', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', null, '1af671a3-3e34-4044-bcce-932600fbe78b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ae379c21-5724-4a54-afe7-fb9ae3ed2fa5', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', null, '1af671a3-3e34-4044-bcce-932600fbe78b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f1f26827-69af-416e-9415-e771184955e7', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', null, '1af671a3-3e34-4044-bcce-932600fbe78b');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('00878791-b8d1-4780-8c5b-117fb1e2ecbc', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', null, 'd59ffc54-01fb-4cd2-8668-885d7846c3fe');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('596e9326-a8c6-4f44-965a-06a48302c01b', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', null, 'abbf3a3a-e7e3-4095-8143-361e788921e4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8486c788-55c2-4d09-ab32-92801f79666e', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', null, 'abbf3a3a-e7e3-4095-8143-361e788921e4');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8090168e-e96f-4581-ac76-1ae5ff4f4e00', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'bcb37c06-40e2-4f8d-9b11-9eb94138e598', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('d0b5b8e8-fdac-4c87-9efb-a20b4acd726d', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5067ce51-37f0-46a5-bfa2-984543e80361', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('802b1293-7380-4bdc-b1a0-eff16e1a854b', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5067ce51-37f0-46a5-bfa2-984543e80361', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c573f67c-4f65-43dc-888a-3b2bff449bb8', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '5067ce51-37f0-46a5-bfa2-984543e80361', null);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a9e3bfad-0640-4b9a-b479-168845ab1ccd', 'Username4SpringOAuth2', 'openid-connect', 'oidc-usermodel-property-mapper', '5067ce51-37f0-46a5-bfa2-984543e80361', null);