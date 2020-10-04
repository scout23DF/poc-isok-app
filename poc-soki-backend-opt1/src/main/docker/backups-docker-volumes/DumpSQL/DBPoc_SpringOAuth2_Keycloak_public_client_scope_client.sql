create table client_scope_client
(
    client_id     varchar(36)           not null
        constraint fk_c_cli_scope_client
            references client,
    scope_id      varchar(36)           not null
        constraint fk_c_cli_scope_scope
            references client_scope,
    default_scope boolean default false not null,
    constraint c_cli_scope_bind
        primary key (client_id, scope_id)
);

alter table client_scope_client
    owner to dbamaster01;

grant select on client_scope_client to replicator;

create index idx_clscope_cl
    on client_scope_client (client_id);

create index idx_cl_clscope
    on client_scope_client (scope_id);

INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ae50f480-f41a-4da3-acff-247fc7c1f4e2', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('ecdd0f72-2c87-46bc-b2f1-65039807e553', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('72ae90e4-4635-4bd9-9605-a1d8898d6a96', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', '1a290f56-e5e4-4a99-b5d8-70fc0bb80f97', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', '0c84ea01-a6b6-42f3-a8ba-aec260c86634', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', 'b8cf8179-455c-4dce-a32f-335744d3b704', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', 'e5e89fa9-ac8b-421e-a6fd-a0e9c0f098cd', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', 'b786157b-6a00-4d21-8394-68404975701f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', '941518b6-63f2-4912-8cc5-7b45a0b90d40', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', '17d991f7-11aa-41d6-87e8-8a5ad30923a8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', 'e6d4c1e6-036f-4018-9609-a0e205a4a507', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('1b7a1f93-5791-449b-b19a-7c8892118d6e', '700b4f56-7e63-40a5-bf6f-0a978279b2f0', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d5a22857-1082-48ee-a0b3-7fd65a5f92dd', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('3ce0da36-54ad-4911-b510-6b871451ed63', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('21320440-b1b3-435c-9932-b05251af5396', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '2ea32f36-8a2d-4565-8000-267954d1b466', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '8358ec8f-e794-451a-b3e9-e1a99664992f', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '3171e3d6-69ba-4732-8815-bf279b192da5', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'd59ffc54-01fb-4cd2-8668-885d7846c3fe', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '1af671a3-3e34-4044-bcce-932600fbe78b', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'be6e0330-f101-456c-9dc8-bb2770104a01', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'abbf3a3a-e7e3-4095-8143-361e788921e4', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '644b2967-63ed-4559-a91c-dc65b8b1de55', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', '92f27ece-595a-497d-a8a4-d7d5d94a44d9', false);