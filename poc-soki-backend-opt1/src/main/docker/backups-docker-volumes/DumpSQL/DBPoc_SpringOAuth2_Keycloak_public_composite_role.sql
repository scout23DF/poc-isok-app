create table composite_role
(
    composite  varchar(36) not null
        constraint fk_a63wvekftu8jo1pnj81e7mce2
            references keycloak_role,
    child_role varchar(36) not null
        constraint fk_gr7thllb9lu8q4vqa4524jjy8
            references keycloak_role,
    constraint constraint_composite_role
        primary key (composite, child_role)
);

alter table composite_role
    owner to dbamaster01;

grant select on composite_role to replicator;

create index idx_composite
    on composite_role (composite);

create index idx_composite_child
    on composite_role (child_role);

INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '82750e00-1327-4050-a430-ab51d6246e6f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '2f8bb661-6490-4633-a2b6-558277ee883d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'e90efad5-9f53-4472-822a-4c00c5e2a8ae');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'aeaf47f7-2fba-4dac-9947-5fa265bfd7f5');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '4160623d-d96e-4d8d-9641-aa4252d35d97');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '80be1784-0916-4fa0-bedb-095e79dd4fe1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '97210bf7-daae-4b3a-ac03-b7189f39a4b6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'b4d03208-c3c9-4b76-92fc-b8c9abd11dc8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '44aa1d29-912a-4638-8637-a147f3963528');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '415925aa-8ff8-438a-ad96-81c7e168f016');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'e82ae716-1e2a-4978-9e21-3ba4fde2cb35');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'a370f872-2775-4b01-99ef-19dc76d83057');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'cb33d84a-13d2-4976-a540-e8b6b7120806');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '0af925d1-fce7-4faf-99e8-258e713420aa');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '02ab4701-ece5-4bbe-95d6-1f7b4538ca6e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '1e916e72-37d3-4844-9d96-491e10fd7d6a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '454688b8-8c35-49ce-8589-f975c8bb8ba0');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'b53b2f69-fe61-4084-9db5-f266012a03f3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('4160623d-d96e-4d8d-9641-aa4252d35d97', '1e916e72-37d3-4844-9d96-491e10fd7d6a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('aeaf47f7-2fba-4dac-9947-5fa265bfd7f5', 'b53b2f69-fe61-4084-9db5-f266012a03f3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('aeaf47f7-2fba-4dac-9947-5fa265bfd7f5', '02ab4701-ece5-4bbe-95d6-1f7b4538ca6e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('c441ff20-25c7-4c70-88e6-431925120e72', 'acd2cceb-eb4e-47c2-bb40-1ec6207f2a51');
INSERT INTO public.composite_role (composite, child_role) VALUES ('c333132e-7e30-430d-85e0-eea5c2d65e0a', '479134d2-4599-4e5c-95b9-2c49bec32a3a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'e044bb86-b772-45de-b616-f3a080192576');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '5a4d683e-82dd-4a80-9f47-57f304c1c911');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'a45c6f62-aeb9-42e0-80d2-b8550bfb3621');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'af074e82-bcbd-4e44-942b-38e61fa16e83');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '00e22abd-bfbb-4fc1-bd44-e289985fcbac');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'c2328365-b558-49bc-8268-6729abb052ec');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '38433445-c31c-47c8-b4ef-bde1de437bd5');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '94a3aa07-afd7-476b-86c8-b8794f91959f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'e7d9fcbc-9320-4fbe-b23e-f7afe6eaf32a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '6300ca88-fa49-472f-9c2f-287028da10e2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'b866d083-c416-4104-8da4-44f7abb4218d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '5ef3f7f1-7273-49a8-aed7-7fedf30175f1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '099d9a68-7e4c-4abb-bdb8-71ee4248ed8e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'caeb73e9-3679-448d-9c86-4096810b00b8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '058c6d77-fa94-443a-828a-1ddba0c6dbb6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'df77041b-f527-4620-90d1-ded1ce4af334');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '82f58e9c-52ad-4d1f-9815-ce2f6adac93f');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', 'ceb8738c-31c7-4920-bc9b-b55d99872a7c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('00e22abd-bfbb-4fc1-bd44-e289985fcbac', 'df77041b-f527-4620-90d1-ded1ce4af334');
INSERT INTO public.composite_role (composite, child_role) VALUES ('af074e82-bcbd-4e44-942b-38e61fa16e83', '058c6d77-fa94-443a-828a-1ddba0c6dbb6');
INSERT INTO public.composite_role (composite, child_role) VALUES ('af074e82-bcbd-4e44-942b-38e61fa16e83', 'ceb8738c-31c7-4920-bc9b-b55d99872a7c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '72cc3190-715b-4aee-a6c8-bf7a917bb29c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '239d6035-d1cb-44b4-84f8-1f9d9878b87c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'dc1dc56b-b0bb-4e22-90e4-56cb0c97ff68');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '2f5e7c31-7316-4c26-82ae-d6409a6d6543');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'b013310d-c6e7-4e44-963e-b10144f53d06');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '0c92b834-e0b2-4028-8bd8-267c4696b776');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'ba8b2f14-c3a7-4418-a16c-163a5a4e6903');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'dc7cb254-39f7-4c60-bcc8-3dde7d5a54ca');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '00fa5ba1-1ac8-4e6c-b1cc-4c83ed249aa1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '94328934-5c8e-4eed-915d-964d12d0c20d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '9e5b40ae-3032-4b51-843f-284242618a01');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '2d78ddff-cac2-4250-b6a1-82de6856d888');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '6ccc9899-bb03-4ada-a7f6-500cf2c2d6de');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'a32fb490-c4b8-40b7-b93f-0c4ecd0de617');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '41b41d7b-de07-4dd1-b18c-a7130203e61b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '43a56efb-3dca-4f9e-8901-80ca4418a8c2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', 'e2c521e6-7194-4820-a152-4cd6cfdbf40a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2f5e7c31-7316-4c26-82ae-d6409a6d6543', '41b41d7b-de07-4dd1-b18c-a7130203e61b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dc1dc56b-b0bb-4e22-90e4-56cb0c97ff68', 'e2c521e6-7194-4820-a152-4cd6cfdbf40a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('dc1dc56b-b0bb-4e22-90e4-56cb0c97ff68', 'a32fb490-c4b8-40b7-b93f-0c4ecd0de617');
INSERT INTO public.composite_role (composite, child_role) VALUES ('cd6ee10f-e970-4684-bfb5-4852ab788461', 'e27ff9d1-025e-4ba2-b294-81ed4b5ca2b1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('15237af2-823b-4642-9040-fa8983632762', '223905fd-8cbe-4b9d-bd1e-ce3dd513be9e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('06297147-ec25-49e7-88fb-355ba9edb384', '38f6297f-314d-4acf-9bc1-e175fa4491a1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('a6c8e12e-675b-443e-a680-a9a047314ec2', '771d8081-20e4-4565-a2f9-963931603e77');