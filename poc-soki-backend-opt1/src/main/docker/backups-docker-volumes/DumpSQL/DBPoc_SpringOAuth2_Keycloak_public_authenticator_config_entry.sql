create table authenticator_config_entry
(
    authenticator_id varchar(36)  not null,
    value            text,
    name             varchar(255) not null,
    constraint constraint_auth_cfg_pk
        primary key (authenticator_id, name)
);

alter table authenticator_config_entry
    owner to dbamaster01;

grant select on authenticator_config_entry to replicator;

INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('c8e6aecf-e441-405d-a898-f6cb4d8b6bdd', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('3aa102b0-10b3-4bcb-a9d8-029b1e3d3d85', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('de39db2e-1248-4964-a164-5228cb2b0756', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('8ebbc1be-64d0-486f-ae49-a05cf3a4aff5', 'false', 'require.password.update.after.registration');