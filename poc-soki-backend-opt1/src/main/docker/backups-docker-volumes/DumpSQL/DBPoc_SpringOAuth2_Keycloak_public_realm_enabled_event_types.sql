create table realm_enabled_event_types
(
    realm_id varchar(36)  not null
        constraint fk_h846o4h0w8epx5nwedrf5y69j
            references realm,
    value    varchar(255) not null,
    constraint constr_realm_enabl_event_types
        primary key (realm_id, value)
);

alter table realm_enabled_event_types
    owner to dbamaster01;

grant select on realm_enabled_event_types to replicator;

create index idx_realm_evt_types_realm
    on realm_enabled_event_types (realm_id);

