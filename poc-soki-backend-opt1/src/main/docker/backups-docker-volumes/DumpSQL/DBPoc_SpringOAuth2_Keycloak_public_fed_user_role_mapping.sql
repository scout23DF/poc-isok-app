create table fed_user_role_mapping
(
    role_id             varchar(36)  not null,
    user_id             varchar(255) not null,
    realm_id            varchar(36)  not null,
    storage_provider_id varchar(36),
    constraint constr_fed_user_role
        primary key (role_id, user_id)
);

alter table fed_user_role_mapping
    owner to dbamaster01;

grant select on fed_user_role_mapping to replicator;

create index idx_fu_role_mapping
    on fed_user_role_mapping (user_id, role_id);

create index idx_fu_role_mapping_ru
    on fed_user_role_mapping (realm_id, user_id);

