
insert into cliente_fisico_juridico ( cli_nome, cli_dt_nasc, cli_endereco, cli_telefone, cli_fis_cpf)
values
('Carla Amorim' , '1969-11-15' , 'Rua A - Cabo frio / PE' , '81988886934', '02156235988'),
('Zuleide Costa' , '1995-12-03' , 'Rua Sexta - Cabo de Santo Agostinho / PE' , '81986225469', '66536982411'),
('Ariadne Golveia' , '1994-05-30' , 'Rua A - Cabo frio / PE' , '81925638547', '55696325428'),
('César Amorim' , '1974-12-20' , 'Rua Meridional - Casa Amarela / PE' , '81936526589', '33022565223'),
('Emanuel Rocha' , '2016-12-03' , 'Rua Nove- Prazeres / PE' , '819854962563', '70980544625')
;


insert into cliente_fisico_juridico ( cli_nome, cli_dt_nasc, cli_endereco, cli_telefone, cli_jur_cnpj, cli_jur_razao_social)
values
('Laura Maria' , '1989-03-15' , 'Rua Santo Aleixo - Cabo frio / AL' , '81986669542', '25625223000125', 'Santos Barros ME'),
('Lucas Lima' , '1999-12-03' , 'Rua Rui Barbosa - Cabo de Santo Agostinho / PE' , '81987662539', '25365365000122', 'Casas Bahia ME'),
('Lindomar Limeira' , '1961-07-30' , 'Rua A - Ibura / PE' , '81999263596', '25369741000123', 'Docuras Chocolate ME'),
('Janete Santos' , '1985-12-22' , 'Rua Meridional - Jaboatão / PE' , '81987523642', '25159357000185', 'Max Shot LTDA'),
('Carlos Ricardo' , '2003-12-09' , 'Rua Nove - Prazeres / PE' , '81995263452', '25659157000185', 'Crystal LTDA')
;


insert into medico (med_nome, med_crm, med_cpf, med_especialidade, med_dt_nasc)
values 
('Carlos Braga', '526587', '26584562522', 'Clinico Geral', '1985-10-25'),
('Roberta Campos', '356248', '02596315742', 'Psiquiatra', '1979-07-09'),
('Romilson Vale', '256895', '15935728654', 'Odontologista', '1985-03-15'),
('George Ribeiro', '154238', '15236485696', 'Terapeuta', '1965-11-05'),
('Noemia Golveia', '184752', '75362448652', 'Ginecologista', '1976-02-17')
;


insert into login_acesso (log_acesso_usuario, log_acesso_senha, fk_med_id)
values
('carlosbraga01','132652','1'),
('robertacampos01','652348','2'),
('romilsonvale01','842158','3'),
('georgeribeiro01','658751','4'),
('noemiagolveia01','256395','5')
;


update medico m inner join login_acesso la on m.med_id = la.fk_med_id
set m.fk_log_acesso_usuario = la.log_acesso_usuario where m.med_id =  '1';
update medico m inner join login_acesso la on m.med_id = la.fk_med_id
set m.fk_log_acesso_usuario = la.log_acesso_usuario where m.med_id =  '2';
update medico m inner join login_acesso la on m.med_id = la.fk_med_id
set m.fk_log_acesso_usuario = la.log_acesso_usuario where m.med_id =  '3';
update medico m inner join login_acesso la on m.med_id = la.fk_med_id
set m.fk_log_acesso_usuario = la.log_acesso_usuario where m.med_id =  '4';
update medico m inner join login_acesso la on m.med_id = la.fk_med_id
set m.fk_log_acesso_usuario = la.log_acesso_usuario where m.med_id =  '5';


insert into exame (ex_data, ex_hora, ex_tipo_exame, med_especialidade, med_nome, cli_nome, fk_med_id, fk_cli_id)
values
('2020-11-25', '13:40:00', 'Colposcopia', 'Ginecologista', 'Noemia Golveia', 'Carla Amorim', '5', '1'),
('2020-11-26', '13:40:00', 'Hemograma', 'Clinico Geral', 'Carlos Braga', 'Lucas Lima', '1', '7'),
('2020-11-27', '13:40:00', 'eletroencefalograma', 'Psiquiatra', 'Roberta Campos', 'César Amorim', '2', '4'),
('2020-11-28', '13:40:00', 'Hemograma', 'Clinico Geral', 'Carlos Braga', 'Carlos Ricardo', '1',  '10'),
('2020-11-29', '13:40:00', 'Ultrassonografia Pélvica', 'Ginecologista', 'Noemia Golveia', 'Laura Maria', '5', '6')
;


insert into fk_cliente_exame  (fk_cli_cod) select cli_id from cliente_fisico_juridico where cli_id is not null;
insert into fk_cliente_exame (fk_ex_cod) select ex_cod from exame where ex_cod is not null;

