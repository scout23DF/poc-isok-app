create table redirect_uris
(
    client_id varchar(36)  not null
        constraint fk_1burs8pb4ouj97h5wuppahv9f
            references client,
    value     varchar(255) not null,
    constraint constraint_redirect_uris
        primary key (client_id, value)
);

alter table redirect_uris
    owner to dbamaster01;

grant select on redirect_uris to replicator;

create index idx_redir_uri_client
    on redirect_uris (client_id);

INSERT INTO public.redirect_uris (client_id, value) VALUES ('7794d3b1-3f3b-4baa-991a-aa74b0cd6cea', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '/admin/master/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('d14028a0-d831-42db-ab01-6cf86a9d9f51', '/realms/PoC-Soki-Realm-01/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', '/realms/PoC-Soki-Realm-01/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '/admin/PoC-Soki-Realm-01/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'http://localhost:8085/*');