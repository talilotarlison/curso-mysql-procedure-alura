-- O que é CURSOR
-- Em sua definição formal, o CURSOR é uma estrutura implementada no MySQL para permitir uma interatividade linha a linha através de uma determinada ordem.

-- Essa ordem é determinada por um comando SELECT, que define o CURSOR. Ou seja, realizamos um comando de consulta na base e o resultado desse comando é carregado em memória nessa variável que chamamos de CURSOR.

-- Fases do CURSOR
-- Para utilizar o CURSOR, precisamos passar por algumas fases.

-- Primeiro, fazemos a declaração do CURSOR. Declaramos o CURSOR, damos um nome para ele e especificamos também na declaração a consulta SQL que estará associada a esse CURSOR.

-- Depois, é preciso fazer a abertura do CURSOR, ou seja, o habilitamos para ser usado. Ao abri-lo, automaticamente o ponteiro do CURSOR estará na posição 0. Quando falamos posição 0, não estamos nos referindo à primeira linha, mas sim ao início do CURSOR antes de percorrer cada linha do resultado dessa variável em memória.

-- Após abrir o CURSOR, percorremos linha a linha. Isto é, vamos para a primeira linha, descemos para a segunda linha, para a terceira linha e assim por diante até o final do CURSOR.

-- Quando chegamos no final do CURSOR, após usar as informações linha a linha, fechamos o CURSOR. Ao fechar o CURSOR, ele é limpo, a memória é limpa e a variável é descartada, no lixo interno da memória.

DECLARE vNOME VARCHAR(10);

DECLARE CURSOR1 CURSOR FOR SELECT NOME FROM TABELA;

OPEN CURSOR1;

FETCH CURSOR1 INTO vNOME; --vNOME JOÃO
FETCH CURSOR1 INTO vNOME; --vNOME JOSÉ
FETCH CURSOR1 INTO vNOME; --vNOME MARIA

CLOSE CURSOR1;


DECLARE fimCursor INTEGER DEFAULT 0;
DECLARE vNOME VARCHAR(10);
DECLARE CURSOR1 CURSOR FOR SELECT NOME FROM TABELA;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;

OPEN CURSOR1; --vNOME vazio, fimCursor 0

WHILE fimCursor = 0 DO
    FETCH CURSOR1 INTO vNOME;
END WHILE;


CLOSE CURSOR1; --vNOME vazio, fimCursor 1