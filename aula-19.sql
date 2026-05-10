SELECT '2023-01-01' + INTERVAL 5 DAY;

-- Código omitido

vDias INTEGER vPrecoUnitario decimal(10,2);

-- Código omitido

-- Código omitido

DECLARE vDataFinal DATE 0;

-- Código omitido

SET vDataFinal = SELECT vDataInicio + INTERNAL vDias DAY

-- Código omitido

USE `insightplaces`;
DROP procedure IF EXISTS `insightplaces`.`novoAluguel_41`;
DELIMITER $$
USE insightplaces $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_41`

-- Código omitido

CALL novoAluguel_41('10008', 'Rafael Peixoto', '3635', '2023-04-05',5,40);

SELECT * FROM alugueis WHERE aluguel_id = '10008';

-- v1
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_41`(vAluguel VARCHAR(10), vClienteNome VARCHAR(150), vHospedagem VARCHAR(10), vDataInicio DATE,
vDias INTEGER, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vDataFinal DATE;
    DECLARE vNumCliente INTEGER;
    DECLARE VPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
        SELECT vMensagem;
    END;
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    WHEN vNumCliente = 0 THEN
        SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
    WHEN vNumCliente = 1 THEN
        -- SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
        SET vDataFinal = (SELECT vDataInicio + INTERVAL vDias DAY) ;
        SET vPrecoTotal = vDias * vPrecoUnitario;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
        INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
        vDataFinal, vPrecoTotal);
        SET vMensagem = 'Aluguel incluido na base com sucesso.';
        SELECT vMensagem;
    WHEN vNumCliente > 1 THEN
       SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
       SELECT vMensagem;
    END CASE;
END