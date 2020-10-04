create table required_action_config
(
    required_action_id varchar(36)  not null,
    value              text,
    name               varchar(255) not null,
    constraint constraint_req_act_cfg_pk
        primary key (required_action_id, name)
);

alter table required_action_config
    owner to dbamaster01;

grant select on required_action_config to replicator;

