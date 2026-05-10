# 🚀 Curso Alura: MySQL - Executando Procedures

![Badge Alura](https://shields.io)
![Badge MySQL](https://shields.io)

Este repositório contém os scripts, anotações e exercícios realizados durante o curso de **MySQL: executando Procedures** da plataforma Alura. O objetivo é dominar a criação e execução de Stored Procedures para otimizar manipulação de dados.

## 📝 Descrição do Projeto

O curso aborda como transformar blocos de código SQL repetitivos em procedimentos armazenados (*Stored Procedures*), melhorando a performance e a organização do banco de dados.

### 🎯 Principais Aprendizados
*   **O que são Procedures:** Armazenar sequências de códigos para uso repetido.
*   **Criação (`CREATE PROCEDURE`):** Definição de nomes e parâmetros (`IN`, `OUT`).
*   **Manipulação:** Inserção (`INSERT`) e exclusão (`DELETE`) de registros via Procedure.
*   **Estruturas de Controle:** Uso de `IF`, `CASE`, `LOOP` e `WHILE` dentro de procedimentos.
*   **Tratamento de Erros:** Definição de `handlers` para exceções.
*   **Delimitadores:** Uso correto do `DELIMITER` para definir o início/fim da procedure.

## 🛠️ Tecnologias Utilizadas
*   MySQL Server
*   MySQL Workbench
*   SQL (Structured Query Language)

## 📂 Como utilizar
1.  Clone este repositório.
2.  Importe o arquivo `.sql` da base de dados disponibilizada no curso (geralmente `sucos_vendas`) no seu MySQL Workbench.
3.  Abra os scripts da pasta `procedures` para visualizar e executar os exemplos.

## 📜 Exemplo de Procedure

```sql
DELIMITER //
CREATE PROCEDURE InserirProduto(IN p_id VARCHAR(50), IN p_nome VARCHAR(50))
BEGIN
    INSERT INTO tabela_de_produtos (CODIGO, NOME) VALUES (p_id, p_nome);
END //
DELIMITER ;
```

## 📚 Certificado
[Emita seu certificado na Alura após concluir as 61 atividades](https://www.alura.com.br/).

---
*Projeto desenvolvido por [Seu Nome] baseando-se no conteúdo da Alura.*
