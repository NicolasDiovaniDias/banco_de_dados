-- Construir um script que apresente uma listagem com o nome dos produtos vendidos pelo pet shop. A listagem
-- deve conter: nome do produto, número da nota fiscal, preço unitário de aquisição deste produto, preço de
-- venda deste produto, os descontos fornecidos e a diferença entre o valor de compra e o valor de venda. A
-- listagem de produtos deve ser ordenada pelo Nome do produto e nº da nota fiscal.
-- Com base no resultado desta listagem, a pet shop MYPETS obteve lucro ou Prejuízo em sua operação?
-- IMPORTANTE: Esta questão deve apresentar o script e a análise do resultado
SELECT 
    produtos.NOME,
    notas_fiscais.NOTA_ID AS NUMERO_NOTA_FISCAL,
    
    produtos.PRECO_UNITARIO AS CUSTO,
    
    notas_fiscais_itens.VALOR_UNITARIO AS PREÇO_CLIENTE,
    
    notas_fiscais_itens.quantidade AS quantidade_vendida,
    
	ROUND(((notas_fiscais_itens.valor_unitario * notas_fiscais_itens.quantidade) - 
	(produtos.PRECO_UNITARIO * notas_fiscais_itens.quantidade) - 
	((notas_fiscais_itens.valor_unitario * notas_fiscais_itens.quantidade) * notas_fiscais_itens.VALOR_DESCONTO / 100)),2) AS lucro,
    
	ROUND((notas_fiscais_itens.valor_unitario - produtos.PRECO_UNITARIO) - 
	(notas_fiscais_itens.valor_unitario * notas_fiscais_itens.VALOR_DESCONTO / 100),2) AS lucro_unitario,
    
    ROUND((notas_fiscais_itens.PERC_DESCONTO/100)*notas_fiscais_itens.valor_total,2) AS DESCONTO_TOTAL,
    
	ROUND((notas_fiscais_itens.PERC_DESCONTO/100)*notas_fiscais_itens.valor_unitario,2) AS DESCONTO_UNITARIO,
	CASE 
        WHEN ((notas_fiscais_itens.valor_unitario * notas_fiscais_itens.quantidade) - 
              (produtos.PRECO_UNITARIO * notas_fiscais_itens.quantidade) - 
              ((notas_fiscais_itens.valor_unitario * notas_fiscais_itens.quantidade) * notas_fiscais_itens.VALOR_DESCONTO / 100)) > 0 
        THEN 'lucrou'
        ELSE 'não lucrou'
    END AS STATUS_LUCRO
FROM 
    notas_fiscais_itens
JOIN PRODUTOS
	ON notas_fiscais_itens.PRODUTO_ID = produtos.PRODUTO_ID
JOIN NOTAS_FISCAIS
	ON notas_fiscais_itens.NOTA_ID = notas_fiscais.NOTA_ID
ORDER BY 
    produtos.NOME, notas_fiscais.NOTA_ID;

-- eu creio que a mypets não tenha lucrado ou tenha chegado muito perto de não lucrar, pois a consulta retornou muitos valores negativos no lucro