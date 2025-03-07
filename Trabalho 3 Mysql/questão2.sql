-- Construir um script que faça o cadastro de dois pets conforme indicados a seguir:
-- 1. Pet: THOR, réptil, raça: Dragão-barbudo, 980g, 12/01/2024, tutor: Larissa Nunes;
-- 2. Pet: Mestre, gato, raça: Persa, 1,4 Kg, 20/08/2022, tutor: Isabella Pinto;

    -- Thor
SET @prox_id = (SELECT IFNULL(MAX(TIPO_PETS_ID), 0) + 1 FROM tipo_pets);
SET @prox_id_pets = (SELECT IFNULL(MAX(TIPO_PETS_ID), 0) + 1 FROM tipo_pets);
INSERT INTO tipo_pets (tipo_pets_id,nome_tipo, raca) 
VALUES (@prox_id,'réptil','Dragão-Barbudo');

insert into pets (nome, peso, nascimento, cliente_id, tipo_pets_id, pet_id)
values ('Thor',0.980,STR_TO_DATE('12/01/2024', '%d/%m/%Y'),
	   (select cliente_id from clientes where nome = "Larissa Nunes" LIMIT 1),@prox_id,@prox_id_pets);

    -- Mestre
SET @prox_id = (SELECT IFNULL(MAX(TIPO_PETS_ID), 0) + 1 FROM tipo_pets);
SET @prox_id_pets = (SELECT IFNULL(MAX(TIPO_PETS_ID), 0) + 1 FROM tipo_pets);
INSERT INTO tipo_pets (tipo_pets_id,nome_tipo, raca) 
VALUES (@prox_id,'gato','Persa');

insert into pets (nome, peso, nascimento, cliente_id, tipo_pets_id, pet_id)
values ('Mestre',1.4,STR_TO_DATE('20/08/2022', '%d/%m/%Y'),
	   (select cliente_id from clientes where nome = "Isabella Pinto" LIMIT 1),@prox_id,@prox_id_pets);

-- os id's não tinham auto increment, não sei se a tabela veio assim ou errei algo quando importei, mas fiz aquelas variaveis ali pra arrumar isso e n mexer no banco