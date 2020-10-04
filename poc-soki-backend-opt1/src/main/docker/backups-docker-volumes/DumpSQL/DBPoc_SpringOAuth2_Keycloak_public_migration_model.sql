create table migration_model
(
    id          varchar(36)      not null
        constraint constraint_migmod
            primary key,
    version     varchar(36),
    update_time bigint default 0 not null
);

alter table migration_model
    owner to dbamaster01;

grant select on migration_model to replicator;

create index idx_update_time
    on migration_model (update_time);

INSERT INTO public.migration_model (id, version, update_time) VALUES ('mrze0', '11.0.2', 1601768451);