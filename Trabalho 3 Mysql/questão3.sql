-- Criar um script que faça uma pesquisa de clientes e apresente o nome de cada cliente bem como o número
-- de pets que cada cliente possui. A lista deve ser ordenada pelo nome de cada cliente.

SELECT clientes.NOME,
        COUNT(pets.PET_ID) AS numero_de_pets
FROM clientes
LEFT JOIN pets
	ON clientes.CLIENTE_ID = pets.CLIENTE_ID
GROUP BY 
    clientes.NOME;