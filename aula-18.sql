CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_35`(vAluguel VARCHAR(10), vClienteNome VARCHAR(150), vHospedagem VARCHAR(10), vDataInicio DATE,
vDataFinal DATE, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vDias INTEGER DEFAULT 0;
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
        SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
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

CREATE PROCEDURE ChecarStatusCliente(vClienteNome VARCHAR(150))
BEGIN
    DECLARE vStatusCliente VARCHAR(20);
    DECLARE vNumPedidos INTEGER;
    SET vNumPedidos = (SELECT COUNT(*) FROM pedidos WHERE clienteNome = vClienteNome);
    
    IF vNumPedidos > 5 THEN
        SET vStatusCliente = 'VIP';
    ELSEIF vNumPedidos BETWEEN 2 AND 5 THEN
        SET vStatusCliente = 'Regular';
    ELSE
        SET vStatusCliente = 'Novato';
    END IF;
    
    SELECT vStatusCliente;
END

-- Nesta aula aprendemos a:

-- Substituir o parâmetro de identificador do cliente pelo nome para inclusão de novos aluguéis.
-- Utilizar o comando SELECT INTO para atribuir valores a variáveis através de SQL.
-- Tratar erros decorrentes de clientes com nomes duplicados.
-- Implementar desvios condicionais com IF-THEN-ELSE para duas opções.
-- Evoluir o gerenciamento de desvios com IF-THEN-ELSE-IF, adicionando uma terceira condição.
-- Substituir o IF-THEN-ELSE-IF por CASE-END CASE para gerenciamento de condições.
-- Finalizar com CASE-END CASE empregando expressões lógicas nos testes, além de comparações diretas com variáveis.