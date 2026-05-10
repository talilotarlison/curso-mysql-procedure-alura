SELECT DAYOFWEEK(STR_TO_DATE('2023-01-01','%Y-%m-%d'));

-- Código omitido

BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vContador INTEGER;
    DECLARE vDiaSemana INTEGER;
    DECLARE vDataFinal DATE;
    DECLARE vNumCliente INTEGER;
    DECLARE vPrecoTotal DECIMAL (10,2);
    DECLARE vMensagem VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    
-- Código omitido

-- Código omitido

SET vContador = 1;
SET vDataFinal vDataInicio;
WHILE vContador < vDias
DO
    SET vDiaSemana (SELECT DAYOFWEEK(STR_TO_DATE(vDataFinal, '%Y-%m-%d')));
    IF (vDiaSemana <> 7 AND vDiaSemana <> 1) THEN
        SET vContador = vContador + 1;
    END IF;
    SET vDataFinal = SEECT vDataFinal + INTERVAL 1 DAY
END WHILE;

-- Código omitido

CALL novoAluguel_42('10010','Gabriela Pires', '8635', '2023-04-12',5,40);

SELECT * FROM alugueis WHERE aluguel_id = '10010';