-- Portanto, vamos inserir o comando ALTER TABLE seguido do nome da tabela que vamos modificar, que é a tabela de proprietários. Em seguida, vamos utilizar a função ADD, seguido de COLUMN, para adicionar uma coluna. Nomearemos essa coluna como qtd_hospedagens, que irá armazenar a quantidade de hospedagens que cada proprietário tem.

ALTER TABLE proprietarios
ADD COLUMN qtd_hospedagens

-- Junto ao nome, especificaremos o tipo de dado que essa coluna irá conter, o que é fundamental para determinar a estrutura da tabela. No caso, essa coluna será do tipo INT, representando números inteiros.

ALTER TABLE proprietarios
ADD COLUMN qtd_hospedagens INT;

-- Dessa forma, conseguiremos adicionar essa coluna à tabela de proprietários. Vamos executar para verificar se a adição é feita corretamente.

-- Nosso código rodou com sucesso. Vamos atualizar a aba de esquemas na lateral esquerda, abrir a tabela de proprietários e clicar ao lado de "Columns" para ver as colunas. Ao fazer isso, já teremos a coluna de quantidade de hospedagens na tabela. Portanto, a adicionamos com sucesso.

-- Renomeando a tabela de alugueis para reservas
-- Agora, temos mais uma modificação que a Insight Places gostaria de fazer: mudar o nome da tabela alugueis para reservas. Para fazer essa modificação do nome da tabela, usaremos a mesma função ALTER TABLE, especificando uma mudança diferente.

-- Nessa mesma aba de consulta, vamos inserir essa nova alteração passando ALTER TABLE alugueis, que é o nome da tabela que queremos renomear. Agora, ao invés de usar ADD COLUMN, que seria para adicionar uma coluna, utilizaremos RENAME TO, indicando que queremos renomear a tabela, e reservas, que é o novo nome.

ALTER TABLE alugueis RENAME TO reservas;

-- Quando temos uma aba de consulta com várias consultas diferentes e queremos rodar apenas uma delas, basta selecionar a consulta desejada com o mouse e clicar no botão "Execute the selected portion of the script or everything, if there is no selection", representado pelo símbolo de um raio. Assim, a consulta será executada com sucesso.

-- Renomeando coluna na tabela de reservas
-- Ao revisarmos novamente nossa aba de esquemas na lateral esquerda, veremos que a última tabela, de aluguéis, já teve o nome modificado para reservas. No entanto, ao abrir esta tabela de reservas e verificar as colunas, ainda encontramos uma coluna chamada aluguel_id, o que não faz mais sentido, uma vez que agora se trata dos IDs das reservas. Como a tabela mudou de nome para reservas, faz sentido também renomearmos essa coluna.

-- Ainda nesta consulta, usaremos o mesmo comando ALTER TABLE, especificando o nome da tabela que será modificada, que agora é a tabela de reservas. Em seguida, colocaremos RENAME COLUMN, para indicar que queremos renomear uma coluna, e informaremos o nome da coluna que será renomeada, que é aluguel_id, seguido de TO e do novo nome desejado, que é reserva_id.

ALTER TABLE reservas RENAME COLUMN aluguel_id TO reserva_id;


-- O UPDATE, que é a cláusula para atualizar os dados, deve ser utilizado em letras maiúsculas, seguindo a convenção de nomenclatura de funções da linguagem. Em seguida, indicaremos a tabela que será atualizada, que neste caso é a tabela hospedagens. Então, definiremos o valor que queremos atribuir à coluna que será modificada. No caso, utilizaremos 1 para representar que as hospedagens foram reativadas, atualizando a coluna ativo para 1.

UPDATE hospedagens
SET ativo=1

UPDATE hospedagens
SET ativo=1
WHERE hospedagem_id IN ('1', '10', '100');

SELECT * from hospedagens;

-- Ao inspecionar os registros, observamos que as hospedagens com IDs 1, 10 e 100 foram atualizadas com sucesso, refletindo o valor 1 na coluna ativo.

-- Atualizando dados na tabela proprietarios
-- Além disso, uma pessoa proprietária alterou seu contato de e-mail, e a Insight Places precisa refletir essa alteração na tabela de proprietários. Vamos abrir uma nova aba de consulta para realizar o UPDATE nesta tabela.

-- Mas, antes de executar a consulta de atualização, é prudente realizar um SELECT na tabela de proprietários para verificar o e-mail atual da proprietária de número 1009 e confirmar se a atualização será aplicada conforme esperado:

SELECT * from proprietarios;

-- Retorno omitido.

-- Ao executar a consulta e verificar o e-mail atual de Daniela Freitas, cujo ID é 1009, vemos que é daniela_120@dominio.com. Agora, podemos prosseguir com a consulta de atualização para modificar apenas a parte do domínio do e-mail para @email.com.

-- Para isso, utilizaremos a cláusula UPDATE, especificaremos o nome da tabela proprietrios e, em seguida, definiremos o novo e-mail como daniela_120@email.com para a proprietária de ID 1009, na coluna de contato. A condição WHERE garantirá que apenas o registro correspondente seja atualizado.

UPDATE proprietarios
SET contato = 'daniela_120@email.com'
WHERE proprietario_id= '1009';

-- Após a execução bem-sucedida da consulta de atualização, faremos outro SELECT para garantir que a alteração tenha sido aplicada corretamente:

SELECT * from proprietarios;

-- Após a execução da consulta, verificamos novamente o e-mail de Daniela Freitas e confirmamos que agora foi atualizado para daniela_120@email.com, como esperado.

-- No vídeo anterior, realizamos algumas atualizações no banco de dados da Insight Places, como a atualização das informações de contato de um proprietário específico e a mudança do status de alguns imóveis de inativos para ativos. Agora, esses imóveis estão disponíveis para reserva na plataforma.

-- No entanto, surge uma nova demanda da Insight Places: excluir o registro de duas hospedagens específicas que foram desativadas. Após entrar em contato com os proprietários, eles confirmaram que não têm interesse em reativar essas hospedagens para disponibilização na plataforma de reserva. Portanto, a Insight Places decidiu remover esses registros do banco de dados, já que não faz mais sentido mantê-los. Para realizar essa exclusão, utilizaremos o comando DELETE, da linguagem SQL.

-- Excluindo registros do banco de dados
-- Na interface do MySQL Workbench, abriremos uma nova aba de consulta. Em seguida, vamos estruturar nossa consulta utilizando o comando DELETE FROM para indicar de qual tabela queremos excluir registros, que, neste caso, é a tabela hospedagens.

DELETE FROM hospedagens

-- É fundamental lembrar que, ao trabalhar com comandos que modificam a estrutura do banco de dados, como DELETE, ALTER TABLE e UPDATE, é necessário incluir uma cláusula WHERE para especificar em quais registros da tabela queremos realizar essa modificação. Isso evita o risco de excluir ou alterar registros incorretos.

-- Além disso, é extremamente importante fazer o backup do banco de dados antes de executar qualquer modificação. Isso garante que, em caso de problemas, tenhamos uma versão anterior do banco de dados para restaurar e evitar possíveis danos, especialmente em ambientes de produção.

-- Vamos adicionar a cláusula WHERE para determinar a condição de exclusão dos registros. A Insight Places forneceu os IDs das hospedagens a serem excluídas: 10000 e 1001. Vamos inserir esses IDs na condição, utilizando a coluna hospedagem_id.

DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000', '1001');

-- Retorno omitido.

-- Ao executar nosso comando, recebemos um erro. Ao investigar, descobrimos que o erro ocorreu devido à existência de uma chave estrangeira relacionada à tabela de avaliações. Isso significa que não podemos excluir essas hospedagens da tabela de hospedagens porque existem registros vinculados a elas na tabela de avaliações.

-- Excluindo registros em tabelas relacionadas
-- Quando há uma relação entre as informações em diferentes tabelas e existe uma restrição de exclusão, não podemos simplesmente excluir registros de uma tabela sem considerar as outras tabelas relacionadas. Por exemplo, não faria sentido ter uma avaliação de um imóvel na tabela de avaliações se essa hospedagem não existir mais no banco de dados.

-- Para resolver esse problema, precisamos aplicar o comando DELETE também na tabela de avaliações. Vamos manter a consulta atual e adicionar o DELETE da tabela de avaliações antes da tabela de hospedagens, pois é como uma ordem de operações: primeiro excluímos da tabela de avaliações e depois da tabela de hospedagens.

-- Vamos escrever o DELETE FROM para a tabela de avaliações, que é avaliacoes, e vamos utilizar a mesma condição que utilizamos para a tabela de hospedagens, ou seja, WHERE hospedagem_id IN ('10000', '1001');, pois queremos excluir os mesmos dados.

DELETE FROM avaliacoes
WHERE hospedagem_id IN ('10000', '1001');

-- Vamos rodar essa consulta primeiro e, se observarmos abaixo no histórico, veremos que a consulta foi executada com sucesso.

-- Agora, vamos executar a segunda consulta, que é para excluir da tabela de hospedagens.

DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000', '1001');

-- Se observarmos novamente, teremos o mesmo erro de chave estrangeira, pois também precisamos excluir da tabela de reservas.

-- É importante analisar os erros que ocorrem nas consultas, pois isso nos ajuda a identificar possíveis problemas e corrigi-los. Se surgir um erro, podemos copiar a mensagem de erro, jogá-la no Google para traduzi-la e entender exatamente o que está errado.

-- Vamos repetir o mesmo processo agora para a tabela de reservas:

DELETE FROM reservas
WHERE hospedagem_id IN ('10000', '1001');

-- Vamos executar essa consulta apenas para garantir que está funcionando corretamente. Em seguida, podemos executar a consulta para a tabela de hospedagens.

DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000', '1001');

-- Ao executar a consulta para a tabela de hospedagens, veremos que agora foi bem-sucedida.

-- Dessa forma, conseguimos remover os registros 10000 e 1001 das tabelas de reservas, avaliações e hospedagens, garantindo que o banco de dados esteja limpo e consistente.

-- Diferença entre DELETE e DROP
-- Com isso, compreendemos o uso correto do comando DELETE. É importante ressaltar que este comando serve apenas para remover dados inseridos na tabela, ou seja, registros contidos dentro dela. Quando desejamos eliminar a estrutura da tabela ou até mesmo o banco de dados, utilizamos o comando DROP. Lembre-se de que anteriormente já havíamos utilizado o DROP SCHEMA no início do curso, quando criamos o banco de dados de teste.

-- Portanto, quando queremos excluir completamente a estrutura de uma tabela ou até mesmo de um banco de dados inteiro, o comando a ser usado é o DROP. A utilização dele é da seguinte forma:

-- Para apagar um banco de dados completo, utilizamos DROP SCHEMA ou DROP DATABASE, que são sinônimos, seguidos do nome do banco de dados a ser removido;
-- No caso de uma tabela, utilizamos DROP TABLE, seguido pelo nome da tabela a ser excluída. É fundamental compreender a diferença entre DELETE e DROP, bem como saber quando e como utilizar cada um!
-- Conclusão e próximos passos
-- Agora, concluímos com sucesso todas as demandas trazidas pela Insight Places. Realizamos consultas, modificações estruturais e alcançamos nossos objetivos neste projeto em parceria com a Insight Places.

-- Em seguida, faremos uma recapitulação de tudo o que aprendemos ao longo do curso!


-- Em aula fizemos algumas alterações finais no banco de dados da Insight Places, vamos relembrar!

-- Começamos adicionando uma coluna na tabela de proprietários usando o seguinte comando:

ALTER TABLE proprietarios
ADD COLUMN qtd_hospedagens INT;

-- Também alteramos o nome da tabela de alugueis e, por consequência, o nome de uma das colunas dessa tabela usando os seguintes comandos:

ALTER TABLE alugueis RENAME TO reservas;

ALTER TABLE reservas RENAME COLUMN aluguel_id TO reserva_id;

-- Depois atualizamos alguns dados da tabela de hospedagens, passamos algumas hospedagens que estavam inativas para ativas com o seguinte código SQL:

UPDATE hospedagens
SET ativo=1
WHERE hospedagem_id IN ('1','10','100');

-- Também atualizamos a informação de contato de uma pessoa proprietária na tabela de proprietarios da seguinte forma:

UPDATE proprietarios
SET contato = 'daniela_120@email.com'
WHERE proprietario_id = '1009';

-- Por fim apagamos os dados de duas hospedagens do banco de dados, utilizando o comando DELETE da seguinte forma:

DELETE FROM avaliacoes
WHERE hospedagem_id IN ('10000','1001');

DELETE FROM reservas
WHERE hospedagem_id IN ('10000','1001');
DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000','1001');