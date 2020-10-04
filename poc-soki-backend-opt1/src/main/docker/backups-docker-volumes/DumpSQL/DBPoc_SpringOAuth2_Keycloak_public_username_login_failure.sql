create table username_login_failure
(
    realm_id                varchar(36)  not null,
    username                varchar(255) not null,
    failed_login_not_before integer,
    last_failure            bigint,
    last_ip_failure         varchar(255),
    num_failures            integer,
    constraint "CONSTRAINT_17-2"
        primary key (realm_id, username)
);

alter table username_login_failure
    owner to dbamaster01;

grant select on username_login_failure to replicator;

