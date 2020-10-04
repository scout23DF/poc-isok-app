create table fed_user_attribute
(
    id                  varchar(36)  not null
        constraint constr_fed_user_attr_pk
            primary key,
    name                varchar(255) not null,
    user_id             varchar(255) not null,
    realm_id            varchar(36)  not null,
    storage_provider_id varchar(36),
    value               varchar(2024)
);

alter table fed_user_attribute
    owner to dbamaster01;

grant select on fed_user_attribute to replicator;

create index idx_fu_attribute
    on fed_user_attribute (user_id, realm_id, name);

