create table realm_supported_locales
(
    realm_id varchar(36)  not null
        constraint fk_supported_locales_realm
            references realm,
    value    varchar(255) not null,
    constraint constr_realm_supported_locales
        primary key (realm_id, value)
);

alter table realm_supported_locales
    owner to dbamaster01;

grant select on realm_supported_locales to replicator;

create index idx_realm_supp_local_realm
    on realm_supported_locales (realm_id);

