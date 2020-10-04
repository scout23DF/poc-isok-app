create table web_origins
(
    client_id varchar(36)  not null
        constraint fk_lojpho213xcx4wnkog82ssrfy
            references client,
    value     varchar(255) not null,
    constraint constraint_web_origins
        primary key (client_id, value)
);

alter table web_origins
    owner to dbamaster01;

grant select on web_origins to replicator;

create index idx_web_orig_client
    on web_origins (client_id);

INSERT INTO public.web_origins (client_id, value) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'http://localhost:8085');