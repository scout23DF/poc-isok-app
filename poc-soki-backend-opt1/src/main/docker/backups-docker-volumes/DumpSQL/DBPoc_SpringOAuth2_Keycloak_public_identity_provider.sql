create table identity_provider
(
    internal_id                varchar(36)           not null
        constraint constraint_2b
            primary key,
    enabled                    boolean default false not null,
    provider_alias             varchar(255),
    provider_id                varchar(255),
    store_token                boolean default false not null,
    authenticate_by_default    boolean default false not null,
    realm_id                   varchar(36)
        constraint fk2b4ebc52ae5c3b34
            references realm,
    add_token_role             boolean default true  not null,
    trust_email                boolean default false not null,
    first_broker_login_flow_id varchar(36),
    post_broker_login_flow_id  varchar(36),
    provider_display_name      varchar(255),
    link_only                  boolean default false not null,
    constraint uk_2daelwnibji49avxsrtuf6xj33
        unique (provider_alias, realm_id)
);

alter table identity_provider
    owner to dbamaster01;

grant select on identity_provider to replicator;

create index idx_ident_prov_realm
    on identity_provider (realm_id);

