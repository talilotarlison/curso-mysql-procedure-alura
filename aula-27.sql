CREATE PROCEDURE `looping_cursor_54` ()
BEGIN
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;

    OPEN cursor1;
    FETCH cursor1 INTO vnome;

    WHILE fimCursor = 0 DO
        SELECT vnome;
        FETCH cursor1 INTO vnome;
    END WHILE;

    CLOSE cursor1;
END

--v1

DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR(255));
CALL inclui_usuarios_lista_52('João, Pedro, Maria, Lucia, Joana, Beatriz');
SELECT * FROM temp_nomes;
CALL looping_cursor_54();

-- v2

CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_54`()
BEGIN
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;
    OPEN cursor1;
    FETCH cursor1 INTO vnome;
    WHILE fimCursor = 0 DO
        SELECT vnome;
        FETCH cursor1 INTO vnome;
    END WHILE;
    CLOSE cursor1;
END

--v3

CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_54_modificado`()
BEGIN
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE vemail VARCHAR(255);
    -- Atualiza a declaração do cursor para incluir o campo email
    DECLARE cursor1 CURSOR FOR SELECT nome, email FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;
    
    OPEN cursor1;
    -- Atualiza o FETCH para capturar ambos, nome e email
    FETCH cursor1 INTO vnome, vemail;
    WHILE fimCursor = 0 DO
        -- Adiciona a lógica para manipular o email junto com o nome
        SELECT vnome, vemail;
        FETCH cursor1 INTO vnome, vemail;
    END WHILE;
    CLOSE cursor1;
END