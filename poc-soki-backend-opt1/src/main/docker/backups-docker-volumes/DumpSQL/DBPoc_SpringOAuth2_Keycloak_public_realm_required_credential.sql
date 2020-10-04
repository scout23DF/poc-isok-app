create table realm_required_credential
(
    type       varchar(255)          not null,
    form_label varchar(255),
    input      boolean default false not null,
    secret     boolean default false not null,
    realm_id   varchar(36)           not null
        constraint fk_5hg65lybevavkqfki3kponh9v
            references realm,
    constraint constraint_92
        primary key (realm_id, type)
);

alter table realm_required_credential
    owner to dbamaster01;

grant select on realm_required_credential to replicator;

INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, 'PoC-Soki-Realm-01');