-- Utilizando a base de dados MYPETS2. Criar um script que possa retornar uma lista com o nome do veterinário,
-- o número do seu CRMV e a DATA e HORA dos agendamentos Abertos (status = A) para este veterinário. A lista
-- deve conter apenas os veterinários da especialidade Clínica Geral.

select 
    funcionarios.NOME,
    veterinarios.ESPECIALIDADE,
    veterinarios.CRMV,
    agendamentos.STATUS,
    agendamentos.DATA_HORA
from
	funcionarios
inner join veterinarios
	on funcionarios.FUNCIONARIO_ID = veterinarios.FUNCIONARIO_ID and
    veterinarios.ESPECIALIDADE = "Clinica geral"
inner join agendamentos
	on agendamentos.STATUS = "A"
order by DATA_HORA