create table realm_events_listeners
(
    realm_id varchar(36)  not null
        constraint fk_h846o4h0w8epx5nxev9f5y69j
            references realm,
    value    varchar(255) not null,
    constraint constr_realm_events_listeners
        primary key (realm_id, value)
);

alter table realm_events_listeners
    owner to dbamaster01;

grant select on realm_events_listeners to replicator;

create index idx_realm_evt_list_realm
    on realm_events_listeners (realm_id);

INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('PoC-Soki-Realm-01', 'jboss-logging');