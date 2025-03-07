-- Construir um script que faça uma pesquisa de clientes. A pesquisa deve retornar as informações de: nome do
-- cliente, a média dos valores pagos pelos clientes e número de compras realizadas pelos clientes, o maior e
-- menor valor de nota fiscal deste cliente. A listagem deve ser ordenada pelo nome dos clientes.

SELECT 
    clientes.NOME,
    AVG(notas_fiscais.valor_total) AS media_valor_pago,
    COUNT(notas_fiscais.NOTA_ID) AS numero_de_compras,
    MAX(notas_fiscais.valor_total) AS maior_valor_nota,
    MIN(notas_fiscais.valor_total) AS menor_valor_nota
FROM 
    clientes
    INNER JOIN notas_fiscais 
		ON clientes.CLIENTE_ID = notas_fiscais.CLIENTE_ID
GROUP BY 
    clientes.CLIENTE_ID
ORDER BY 
    clientes.NOME;