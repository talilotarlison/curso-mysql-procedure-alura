SET RESTANTE = LISTA;
WHILE INSTR(RESTANTE,',') > 0 DO
        SET POS = INSTR(RESTANTE,',');
        SET NOME = LEFT(RESTANTE, POS-1);
        INSERT INTO TABELA VALUE (NOME);
        RESTANTE = SUBSTRING(RESTANTE, POS + 1);
END WHILE;

IF TRIM(RESTANTE) <> '' THEN

     INSERT INTO TABELA VALUE (TRIM(RESTANTE));

END IF

--- v1
CREATE PROCEDURE `inclui_usuarios_lista`(lista, VARCHAR(255))
BEGIN
    DECLARE nome VARCHAR(255);
    DECLARE restante VARCHAR(255);
    DECLARE pos INTEGER;
    SET restante = lista;
    WHILE INSTR(restante,',') > 0 DO
        SET pos = INSTR(restante,',');
        SET nome = LEFT(restante, pos -1);
    END WHILE
END

--v2
CREATE PROCEDURE `inclui_usuarios_lista`(lista, VARCHAR(255))
BEGIN
    DECLARE nome VARCHAR(255);
    DECLARE restante VARCHAR(255);
    DECLARE pos INTEGER;
    SET restante = lista;
    WHILE INSTR(restante,',') > 0 DO
        SET pos = INSTR(restante,',');
        SET nome = LEFT(restante, pos -1);
        INSERT INTO temp_nomes VALUES(nome);
    END WHILE
END

--v3
CREATE PROCEDURE `inclui_usuarios_lista`(lista, VARCHAR(255))
BEGIN
    DECLARE nome VARCHAR(255);
    DECLARE restante VARCHAR(255);
    DECLARE pos INTEGER;
    SET restante = lista;
    WHILE INSTR(restante,',') > 0 DO
        SET pos = INSTR(restante,',');
        SET nome = LEFT(restante, pos -1);
        INSERT INTO temp_nomes VALUES(nome);
        SET restante = SUBSTRING(restante, pos + 1);
    END WHILE
    IF TRIM(restante) <> '' THEN
        INSERT INTO temp_nomes VALUES(TRIM(restante));
    END IF;
END

---v4

CREATE PROCEDURE `inclui_usuarios_lista_52`(lista, VARCHAR(255))
BEGIN
    DECLARE nome VARCHAR(255);
    DECLARE restante VARCHAR(255);
    DECLARE pos INTEGER;
    SET restante = lista;
    WHILE INSTR(restante,',') > 0 DO
        SET pos = INSTR(restante,',');
        SET nome = LEFT(restante, pos -1);
        INSERT INTO temp_nomes VALUES(nome);
        SET restante = SUBSTRING(restante, pos + 1);
    END WHILE
    IF TRIM(restante) <> '' THEN
        INSERT INTO temp_nomes VALUES(TRIM(restante));
    END IF;
END