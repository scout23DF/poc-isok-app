create table user_federation_config
(
    user_federation_provider_id varchar(36)  not null
        constraint fk_t13hpu1j94r2ebpekr39x5eu5
            references user_federation_provider,
    value                       varchar(255),
    name                        varchar(255) not null,
    constraint constraint_f9
        primary key (user_federation_provider_id, name)
);

alter table user_federation_config
    owner to dbamaster01;

grant select on user_federation_config to replicator;

