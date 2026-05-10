-- Por último, a empresa pediu para ver apenas os 10 primeiros proprietários. Então, vamos limitar o número de registros dessa consulta exatamente por 10 registros, que são os 10 proprietários que mais têm hospedagens cadastradas. Então, colocamos LIMIT 10. Vamos colocar ponto e vírgula e rodar agora a nossa consulta.

SELECT p.nome AS nome_proprietario, COUNT(h.hospedagem_id) AS total_hospedagens_ativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hospedagens_ativas DESC
LIMIT 10;

-- Analisando os resultados, temos o total de hospedagens inativas por proprietário. Não limitamos o número de registros, porque a Insight Places quer entender quanto cada proprietário tem de hospedagem inativa.


SELECT p.nome AS nome_proprietario, COUNT(*) AS total_hospedagens_inativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome;

SELECT p.nome AS nome_proprietario, COUNT(h.hospedagem_id) AS total_hospedagens_ativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hospedagens_ativas DESC
LIMIT 10;



SELECT p.nome AS nome_proprietario, COUNT(*) AS total_hospedagens_inativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome;

SELECT YEAR(data_inicio) AS ano, MONTH(data_inicio) AS mes, COUNT(*) AS total_alugueis
FROM alugueis
GROUP BY ano, mes
ORDER BY total_alugueis DESC;

-- Durante essa aula realizamos várias consultas SQL que trouxeram informações importantes para a empresa, então vamos relembrar. Chegou a hora de você relembrá-las! Não esqueça de seguir todas as etapas para que seu avanço no projeto e no conteúdo seja completo.

-- Filtramos as hospedagens mais bem avaliadas, ou seja, que tiveram como nota 4 ou 5 através da seguinte consulta:

SELECT * FROM avaliacoes
WHERE nota >=4;

-- Também filtramos todas as hospedagens disponíveis que fossem do tipo hotel e estivessem ativas na plataforma com o seguinte código SQL:

SELECT * FROM hospedagens
WHERE tipo = 'hotel' AND ativo = 1;

-- Calculamos o gasto médio de cada cliente dentro da plataforma utilizando o comando a seguir:

SELECT cliente_id, AVG(preco_total) AS ticket_medio
FROM alugueis
GROUP BY cliente_id;

-- Outra informação que buscamos foi a média de dias de estadia de cada cliente, para isso criamos o seguinte código:

SELECT cliente_id, AVG(DATEDIFF(data_fim,data_inicio)) AS media_dias_estadia
FROM alugueis
GROUP BY cliente_id
ORDER BY media_dias_estadia DESC;

-- Filtramos os top 10 proprietários com mais hospedagens ativas na plataforma fazendo a seguinte consulta:

SELECT p.nome AS nome_proprietario, COUNT(h.hospedagem_id) 
AS total_hospedagens_ativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = h.proprietario_id
WHERE h.ativo = 1
GROUP BY p.nome
ORDER BY total_hospedagens_ativas DESC
LIMIT 10;

-- Trouxemos também o número de hospedagens inativas por proprietário, com o seguinte comando:

SELECT p.nome AS nome_proprietario, COUNT(*) AS total_hospedagens_inativas
FROM proprietarios p
JOIN hospedagens h ON p.proprietario_id = 
h.proprietario_id
WHERE h.ativo = 0
GROUP BY p.nome;

-- Por fim, identificamos os períodos de maior e menor demanda de aluguel na plataforma com a seguinte consulta:

SELECT YEAR(data_inicio) AS ano,
MONTH(data_inicio) AS mes,
COUNT(*) AS total_alugueis
FROM alugueis
GROUP BY ano, mes
ORDER BY total_alugueis DESC;

-- Utilizar operadores lógicos e de comparação;
-- Criar consultas aplicando as funções AVG e COUNT;
-- Utilizar o comando JOIN;
-- Aplicar funções específicas para dados do tipo DATE.