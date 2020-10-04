create table user_group_membership
(
    group_id varchar(36) not null,
    user_id  varchar(36) not null
        constraint fk_user_group_user
            references user_entity,
    constraint constraint_user_group
        primary key (group_id, user_id)
);

alter table user_group_membership
    owner to dbamaster01;

grant select on user_group_membership to replicator;

create index idx_user_group_mapping
    on user_group_membership (user_id);

