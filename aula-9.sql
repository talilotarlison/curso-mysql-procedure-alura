BEGIN
    DECLARE vAluguel VARCHAR(10) DEFAULT '10001';
    DECLARE vCliente VARCHAR(10) DEFAULT '1002';
    DECLARE vHospedagem VARCHAR(10) DEFAULT '8635';
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.23;
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
END$$


USE `insightplaces`;
DROP PROCEDURE IF EXISTS `insightplaces`.`novoAluguel_23`;
DELIMITER $$
USE `insightplaces`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`()
BEGIN
    DECLARE vAluguel VARCHAR(10) DEFAULT '10001';
    DECLARE vCliente VARCHAR(10) DEFAULT '1002';
    DECLARE vHospedagem VARCHAR(10) DEFAULT '8635';
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL(10,2) DEFAULT 550.23;
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
END$$
DELIMITER ;


-- Código omitido

CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`
(vAluguel VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10), vDataInicio DATE, vDataFinal DATE, vPrecoTotal DECIMAL(10,2))

-- Código omitido


USE `insightplaces`;
DROP PROCEDURE IF EXISTS `insightplaces`.`novoAluguel_23`;
DELIMITER $$
USE `insightplaces`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`
(vAluguel VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10), vDataInicio DATE, vDataFinal DATE, vPrecoTotal DECIMAL(10,2))
BEGIN
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
END$$
DELIMITER ;

-- 1002

CALL novoAluguel_23('10002', '1003', '8635', '2023-03-06', '2023-03-10', 600);

CALL novoAluguel_23('10003', '1004', '8635', '2023-03-10', '2023-03-12', 250);

SELECT * FROM alugueis WHERE aluguel_id IN ('10002', 10003);


CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`(vAluguel VARCHAR(10), vCliente VARCHAR(10), vHospedagem VARCHAR(10), vDataInicio DATE,
vDataFinal DATE, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vDias INTEGER DEFAULT 0;
    DECLARE VPrecoTotal DECIMAL(10,2);
    SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoUnitario;
    INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
    vDataFinal, vPrecoTotal);
END