create table client_session_prot_mapper
(
    protocol_mapper_id varchar(36) not null,
    client_session     varchar(36) not null
        constraint fk_33a8sgqw18i532811v7o2dk89
            references client_session,
    constraint constraint_cs_pmp_pk
        primary key (client_session, protocol_mapper_id)
);

alter table client_session_prot_mapper
    owner to dbamaster01;

grant select on client_session_prot_mapper to replicator;

