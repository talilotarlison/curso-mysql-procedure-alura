USE `insightplaces`;
DROP PROCEDURE IF EXISTS `insightplaces`.`novosAlugueis_55`;
;

DELIMITER $$
USE `insightplaces`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novosAlugueis_55`(lista VARCHAR(255), vHospedagem VARCHAR(10), vDataInicio DATE, vDias INTEGER, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vClienteNome VARCHAR(150);
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
    CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR(255));
    CALL inclui_usuarios_lista_52(lista);
    OPEN cursor1;
    FETCH cursor1 INTO vnome;
    WHILE fimCursor = 0 DO
        SET vClienteNome = vnome;
        CALL novoAluguel_44 (vClienteNome, vHospedagem, vDataInicio, vDias, vPrecoUnitario);
        FETCH cursor1 INTO vnome;
    END WHILE;
    CLOSE cursor1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
END$$

DELIMITER ;
;

CALL novoAluguel_44('Lívia Fogaça', '8635', '2023-05-29', 5, 45);


CALL novosAlugueis_55('Gabriel Carvalho,Erick Oliveira,Catarina Correia,Lorena Jesus', '8635', '2023-06-03', 7, 45);

SELECT * FROM alugueis WHERE aluguel_id IN ('10017', '10016', '10015', '10014');


-- v3

CREATE DEFINER=`root`@`localhost` PROCEDURE `novosAlugueis_55`(lista VARCHAR(255),
vHospedagem VARCHAR(10), vDataInicio DATE,
vDias INTEGER, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vClienteNome VARCHAR(150);
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
    CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR(255));
    CALL inclui_usuarios_lista_52(lista);
    OPEN cursor1;
    FETCH cursor1 INTO vnome;
    WHILE fimCursor = 0 DO
        SET vClienteNome = vnome;
        CALL novoAluguel_44 (vClienteNome, vHospedagem, vDataInicio, vDias, vPrecoUnitario);
        FETCH cursor1 INTO vnome;
    END WHILE;
    CLOSE cursor1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
END

-- Nesta aula aprendemos a:

-- Gerenciar a inclusão de múltiplos clientes em uma hospedagem usando uma tabela temporária, devido à limitação estrutural da base de dados.
-- Utilizar a estrutura de cursor para iterar sobre os registros da tabela temporária.
-- Compreender o funcionamento do cursor no MySQL.
-- Implementar a inclusão de aluguéis baseando-se nos dados dos clientes armazenados na tabela temporária.



-- O que aprendemos?
-- Inicialmente, substituímos a inclusão de novos aluguéis, que antes eram feitos através de comandos INSERT, por simples stored procedures, que fomos aprimorando.

-- Primeiro, alteramos a inclusão de uma hospedagem que era feita pelo código do cliente. Passamos a usar o nome do cliente. No entanto, isso gerou um erro. Descobrimos que havia clientes diferentes com o mesmo nome.

-- Por isso, começamos a gerenciar os erros que isso acabava gerando quando utilizávamos a entrada dos novos aluguéis pelo nome.

-- Aprendemos também como inserir a data inicial e o número de dias na hora de criar um novo aluguel, em vez de entrar com a data inicial e final. Ademais, trabalhamos com o cálculo do valor total a ser pago através do número de dias e do valor da diária.

-- Outra solução que implementamos na Insight Places foi no gerenciamento automático dos identificadores de novos aluguéis. A própria stored procedure passou a criar esse ID, eliminando a necessidade de nos preocuparmos com isso. Isso foi uma grande vantagem.

-- Exploramos como incluir vários clientes dentro da mesma hospedagem. E tudo isso usando conceitos e ferramentas novas de uma SQL associadas a procedures.

-- A resolução desses problemas trouxe para vocês um monte de conhecimento e habilidade que vão ajudar a resolver outros problemas relacionados com banco de dados.

-- Agora, vocês já sabem criar uma stored procedure, que acaba fazendo um trabalho pesado e deixando as operações do banco de dados mais rápidas e inteligentes. Vocês também aprenderam como utilizar cursores, tabelas temporárias e como lidar com erros de uma maneira mais profissional.

-- Resolvendo os problemas da Insight Places, vocês descobriram como passar informações através de valor e referência para dentro das procedures e também fazer procedures trabalharem juntas, uma procedure chamando a outra.

-- Junto, conhecemos um monte de funções e comandos inteligentes de MySQL que você utilizou dentro das procedures, mas que também pode utilizar fora, diretamente, quando trabalharem com SQL.

-- Todos esses novos conhecimentos possibilitam a vocês abrirem um novo caminho na carreira, preparando vocês a encararem problemas complicados de banco de dados e agora, claro, com mais segurança e habilidade para resolvê-los.

-- Conclusão
-- Com este curso finalizado, você está preparado a enfrentar os desafios do dia a dia com soluções mais criativas e mais eficientes. Isso, com certeza, será um novo capítulo na vida profissional caso queira se aprofundar e trabalhar na área de TI com banco de dados.

-- Esperamos encontrá-los em outros cursos desta formação e de outras formações da escola. Um abraço e até o próximo curso.