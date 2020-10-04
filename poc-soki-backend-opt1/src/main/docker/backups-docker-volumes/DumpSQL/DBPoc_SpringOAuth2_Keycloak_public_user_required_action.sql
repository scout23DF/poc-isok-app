create table user_required_action
(
    user_id         varchar(36)                                 not null
        constraint fk_6qj3w1jw9cvafhe19bwsiuvmd
            references user_entity,
    required_action varchar(255) default ' '::character varying not null,
    constraint constraint_required_action
        primary key (required_action, user_id)
);

alter table user_required_action
    owner to dbamaster01;

grant select on user_required_action to replicator;

create index idx_user_reqactions
    on user_required_action (user_id);

