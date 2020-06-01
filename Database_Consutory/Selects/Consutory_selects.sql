Select 
e.cli_nome Paciente, 
e.ex_tipo_exame Tipo_de_Exame, 
e.med_especialidade Especialidade_do_Médico, 
e.med_nome Médico, 
e.ex_data Data_do_Exame, 
e.ex_hora Hora_do_Exame
from exame e
where 
e.med_nome = 'Carlos Braga'
;

Select 
c.cli_nome Paciente, 
e.ex_tipo_exame Tipo_de_Exame, 
e.ex_data Data_do_Exame, 
e.ex_hora Hora_do_Exame,
m.med_especialidade Especialidade_do_Médico, 
m.med_nome Médico
from 
exame e,
medico m,
cliente_fisico_juridico c
where
e.fk_med_id = m.med_id
and e.fk_cli_id = c.cli_id
and ex_hora is not null
;

Select 
c.cli_nome Cliente_PF, 
c.cli_fis_cpf CPF, 
count(c.cli_nome) Qtd 
from cliente_fisico_juridico c 
where c.cli_fis_cpf is not null 
group by c.cli_nome
;

Select 
c.cli_nome Cliente_PJ, 
c.cli_jur_cnpj CNPJ, 
cli_jur_razao_social Razão, 
count(c.cli_nome) Qtd 
from cliente_fisico_juridico c 
where c.cli_jur_cnpj is not null 
group by c.cli_nome
;

Select
m.med_nome Médico, 
m.med_crm CRM,
m.med_especialidade Especialidade_do_Médico,
la.log_acesso_usuario Úsuario,
la.log_acesso_senha Senha
from
medico m,
login_acesso la
where
m.fk_log_acesso_usuario = la.log_acesso_usuario
and m.med_cpf is not null
order by m.med_nome asc
;

