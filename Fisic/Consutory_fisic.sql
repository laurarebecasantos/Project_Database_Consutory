-- DROP DATABASE consultorio;

 create database consultorio;
 use consultorio;

create table cliente_fisico_juridico (
cli_id int primary key not null auto_increment,
cli_nome varchar(50) not null,
cli_dt_nasc date not null,
cli_endereco varchar(100) not null,
cli_telefone varchar(13) not null,
cli_fis_cpf varchar(11) null,
cli_jur_cnpj varchar(14) null,
cli_jur_razao_social varchar(50) null
) auto_increment = 0001;

create table medico (
med_id int primary key not null auto_increment,
med_nome varchar(50) not null,
med_crm varchar(10) not null,
med_cpf varchar(11) not null,
med_especialidade varchar(50) not null,
med_dt_nasc date not null,
fk_log_acesso_usuario varchar(20) null
) auto_increment = 001;

create table exame (
ex_cod int primary key not null auto_increment,
ex_data date not null,
ex_hora time null,
ex_tipo_exame varchar(100) not null,
med_especialidade varchar(50) not null,
med_nome varchar(50) not null,
cli_nome varchar(50) not null,
fk_med_id int null,
fk_cli_id int null,
foreign key(fk_med_id) references medico(med_id),
foreign key(fk_cli_id) references cliente_fisico_juridico(cli_id)
) auto_increment = 00001;

create table fk_cliente_exame (
cli_ex_cod int primary key not null auto_increment,
fk_ex_cod int null,
fk_cli_cod int null,
foreign key(fk_ex_cod) references exame(ex_cod),
foreign key(fk_cli_cod) references cliente_fisico_juridico(cli_id) 
) auto_increment = 000000;

create table login_acesso (
log_acesso_usuario varchar(20) primary key not null,
log_acesso_senha varchar(8) not null,
fk_med_id int null,
foreign key(fk_med_id) references medico(med_id)
);

alter table medico add foreign key(fk_log_acesso_usuario) references login_acesso(log_acesso_usuario);