create table databasechangeloglock
(
    id          integer not null
        constraint pk_databasechangeloglock
            primary key,
    locked      boolean not null,
    lockgranted timestamp,
    lockedby    varchar(255)
);

alter table databasechangeloglock
    owner to dbamaster01;

grant select on databasechangeloglock to replicator;

INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1, false, null, null);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1000, false, null, null);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1001, false, null, null);