create table client_attributes
(
    client_id varchar(36)  not null
        constraint fk3c47c64beacca966
            references client,
    value     varchar(4000),
    name      varchar(255) not null,
    constraint constraint_3c
        primary key (client_id, name)
);

alter table client_attributes
    owner to dbamaster01;

grant select on client_attributes to replicator;

INSERT INTO public.client_attributes (client_id, value, name) VALUES ('7b8f81bd-32fa-4952-bf35-9b7ab46ca70f', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('0acb1dc9-e951-4a48-8581-9436e7da12cc', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('95a91113-a1ca-48e9-a0e7-5320c3f6422a', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('bcb37c06-40e2-4f8d-9b11-9eb94138e598', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('5067ce51-37f0-46a5-bfa2-984543e80361', 'false', 'display.on.consent.screen');