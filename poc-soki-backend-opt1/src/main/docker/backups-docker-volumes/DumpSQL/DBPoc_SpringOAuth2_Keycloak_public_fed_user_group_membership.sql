create table fed_user_group_membership
(
    group_id            varchar(36)  not null,
    user_id             varchar(255) not null,
    realm_id            varchar(36)  not null,
    storage_provider_id varchar(36),
    constraint constr_fed_user_group
        primary key (group_id, user_id)
);

alter table fed_user_group_membership
    owner to dbamaster01;

grant select on fed_user_group_membership to replicator;

create index idx_fu_group_membership
    on fed_user_group_membership (user_id, group_id);

create index idx_fu_group_membership_ru
    on fed_user_group_membership (realm_id, user_id);

