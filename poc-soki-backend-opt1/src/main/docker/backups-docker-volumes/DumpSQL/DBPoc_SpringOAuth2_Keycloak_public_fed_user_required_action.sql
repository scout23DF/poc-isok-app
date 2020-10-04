create table fed_user_required_action
(
    required_action     varchar(255) default ' '::character varying not null,
    user_id             varchar(255)                                not null,
    realm_id            varchar(36)                                 not null,
    storage_provider_id varchar(36),
    constraint constr_fed_required_action
        primary key (required_action, user_id)
);

alter table fed_user_required_action
    owner to dbamaster01;

grant select on fed_user_required_action to replicator;

create index idx_fu_required_action
    on fed_user_required_action (user_id, required_action);

create index idx_fu_required_action_ru
    on fed_user_required_action (realm_id, user_id);

