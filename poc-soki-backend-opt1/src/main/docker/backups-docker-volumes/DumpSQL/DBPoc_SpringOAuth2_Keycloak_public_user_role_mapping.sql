create table user_role_mapping
(
    role_id varchar(255) not null,
    user_id varchar(36)  not null
        constraint fk_c4fqv34p1mbylloxang7b1q3l
            references user_entity,
    constraint constraint_c
        primary key (role_id, user_id)
);

alter table user_role_mapping
    owner to dbamaster01;

grant select on user_role_mapping to replicator;

create index idx_user_role_mapping
    on user_role_mapping (user_id);

INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('8f628a3e-3a1d-41b6-8a4c-ef418e2f01b6', 'fb674332-03e0-4959-9fc7-2e8826a0de8a');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5325dae2-4ad5-4519-bf07-f43721c3896c', 'fb674332-03e0-4959-9fc7-2e8826a0de8a');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('c441ff20-25c7-4c70-88e6-431925120e72', 'fb674332-03e0-4959-9fc7-2e8826a0de8a');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('1555f57b-d48a-4ac2-8064-16f203efc559', 'fb674332-03e0-4959-9fc7-2e8826a0de8a');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'fb674332-03e0-4959-9fc7-2e8826a0de8a');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('cd6ee10f-e970-4684-bfb5-4852ab788461', '6877c510-010f-4344-8355-40743732e9bd');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('68465770-630c-4aa4-98a4-63a810c7aa91', '6877c510-010f-4344-8355-40743732e9bd');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('94f68f32-df10-4d4c-aa0c-f06fea1327d8', '6877c510-010f-4344-8355-40743732e9bd');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('b284cb80-aba0-4511-bc09-415b47ea7280', '6877c510-010f-4344-8355-40743732e9bd');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('51adae9a-0f42-4e19-b43d-69aee2bc199b', '6877c510-010f-4344-8355-40743732e9bd');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('cd6ee10f-e970-4684-bfb5-4852ab788461', '15b7da9a-5ddb-4f57-bd7e-bc21a314c05b');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('68465770-630c-4aa4-98a4-63a810c7aa91', '15b7da9a-5ddb-4f57-bd7e-bc21a314c05b');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('94f68f32-df10-4d4c-aa0c-f06fea1327d8', '15b7da9a-5ddb-4f57-bd7e-bc21a314c05b');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('b284cb80-aba0-4511-bc09-415b47ea7280', '15b7da9a-5ddb-4f57-bd7e-bc21a314c05b');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('8f628a3e-3a1d-41b6-8a4c-ef418e2f01b6', '1db85a5b-c7b8-4350-973d-c9fc90513819');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5325dae2-4ad5-4519-bf07-f43721c3896c', '1db85a5b-c7b8-4350-973d-c9fc90513819');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('c441ff20-25c7-4c70-88e6-431925120e72', '1db85a5b-c7b8-4350-973d-c9fc90513819');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('1555f57b-d48a-4ac2-8064-16f203efc559', '1db85a5b-c7b8-4350-973d-c9fc90513819');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '1db85a5b-c7b8-4350-973d-c9fc90513819');