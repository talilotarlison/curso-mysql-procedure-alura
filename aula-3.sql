--  melhores hoteis
SELECT * FROM avaliacoes WHERE nota >= 4

--  melhores hoteis ativos
SELECT * FROM hospedagens WHERE tipo = 'hotel' AND ativo = 1;


-- Você é o gerente de uma loja de eletrônicos e está interessado em analisar o desempenho de vendas de determinados produtos em uma determinada faixa de preço. Você deseja encontrar todos os produtos vendidos que tenham um preço superior a R$500 e inferior a R$1000, para entender melhor quais categorias de produtos estão gerando mais receita dentro desse intervalo de preço.

-- Dados:

-- Tabela produtos_vendidos:

-- id_produto (int): Identificador único do produto.
-- nome (varchar): Nome do produto.
-- categoria (varchar): Categoria do produto.
-- preco (float): Preço do produto.
-- quantidade_vendida (int): Quantidade de unidades vendidas.
-- Escreva uma consulta SQL para selecionar todos os produtos vendidos que tenham um preço superior a R$500 e inferior a R$1000.

SELECT nome, categoria FROM produtos_vendidos WHERE preco > 500 AND preco < 1000;

-- ticker medio dos clientes
SELECT cliente_id, AVG(preco_total) AS ticket_medio
FROM alugueis
GROUP BY cliente_id;

-- medias das estadias
SELECT cliente_id, AVG(DATEDIFF(data_fim, data_inicio)) AS media_dias_estadia
FROM alugueis
GROUP BY cliente_id
ORDER BY media_dias_estadia DESC;


-- A empresa XYZ deseja analisar o desempenho médio de vendas dos seus produtos ao longo do último ano para identificar áreas de melhoria e oportunidades de crescimento. A tabela vendas no banco de dados contém as colunas produto_id, quantidade_vendida, preco_venda e data_venda. A empresa está interessada em calcular o preço médio de venda de cada produto ao longo do último ano.

-- Qual das seguintes consultas SQL utilizará corretamente a função AVG para calcular o preço médio de venda de cada produto no último ano?

SELECT produto_id, AVG(preco_venda) AS preco_medio
FROM vendas
WHERE data_venda BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE()
GROUP BY produto_id;