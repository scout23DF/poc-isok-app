create table credential
(
    id              varchar(36) not null
        constraint constraint_f
            primary key,
    salt            bytea,
    type            varchar(255),
    user_id         varchar(36)
        constraint fk_pfyr0glasqyl0dei3kl69r6v0
            references user_entity,
    created_date    bigint,
    user_label      varchar(255),
    secret_data     text,
    credential_data text,
    priority        integer
);

alter table credential
    owner to dbamaster01;

grant select on credential to replicator;

create index idx_user_credential
    on credential (user_id);

INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('044f83e5-2098-494d-aae6-3fe03862b32c', null, 'password', '15b7da9a-5ddb-4f57-bd7e-bc21a314c05b', 1601768981675, null, '{"value":"BDJ7taOlygz3Vv7Oq2Mj33fM5hpC1e+C43dPCtOEu75WH0sZypwHVsNaN5M6snbVRnFCvxRG3mUYIADLJDWRMg==","salt":"kndg6Krn6D3uB9VuAjj2qA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('9fc574b6-b8b4-45a3-ad85-11066f106a77', null, 'password', 'fb674332-03e0-4959-9fc7-2e8826a0de8a', 1601808459823, null, '{"value":"p/dPLCcgJm2wC00qlaHlPDcCZCW/R+3R345qMH4EhYQ1ubKXbwGG9oVPtl8bnSKcuSRI9VsQLLstDM2cgZyc7g==","salt":"0CIf/iB9dWAo5y4qahNovA=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('ad22fa55-f1dc-413b-9d1f-13a43532db3e', null, 'password', '1db85a5b-c7b8-4350-973d-c9fc90513819', 1601808710594, null, '{"value":"S9snE2vjLDV98WCO5Mig2pqWROPLLd7fVaOeppe6E/eLcCAvihJ48a9mkAQHqtE0jSK+SQtvO7jmdDvoFpAu9Q==","salt":"ObthJR3VJjBqmDW/EBorVQ=="}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256"}', 10);