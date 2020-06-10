-- UPDATE, INSERT E DELETE

-- INSERT INTO
    -- IDCLIENTE, NOME, SEXO, E-MAIL, NUMERO, TIPO, BAIRRO, CIDADE, ESTADO 
INSERT INTO V_RELATORIO 
VALUES(NULL, 'ANDREIA', 'F', 'ANDREIA@UOL.COM.BR', '98735-7864', 'CEL', 'CENTRO', 'VITORIA', 'ES');
-- ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list

-- NÃO É POSSIVEL FAZER INSERT EM VIEWS COM 
-- NÃO É POSSIVEL FAZER DELETE EM VIEWS COM JOIN

-- APENAS É POSSIVEL FAZER UPDATE EM VIEWS COM JOIN, 

UPDATE V_RELATORIO SET NOME = 'JOSE' WHERE NOME = 'JORGE'; 
-- MINHA VIEW TEM UM ORDER BY QUE NÃO DEIXA FAZER UPDATE, MAS DARIA CERTO

DROP TABLE JOGADORES;
CREATE TABLE JOGADORES(
    IDJOGADOR INT,
    NOME VARCHAR(30),
    ESTADO CHAR(2)
);

-- SHOW TABLES;
INSERT INTO JOGADORES VALUES(1, 'GUERREIRO', 'RS');
INSERT INTO JOGADORES VALUES(2, 'GABIGOL', 'RJ');
INSERT INTO JOGADORES VALUES(3, 'GANSO', 'RJ');
INSERT INTO JOGADORES VALUES(4, 'NENÊ', 'RJ');
INSERT INTO JOGADORES VALUES(5, 'LOVE', 'SP');

SELECT IDJOGADOR, NOME, ESTADO FROM JOGADORES;
/*
+-----------+-----------+--------+
| IDJOGADOR | NOME      | ESTADO |
+-----------+-----------+--------+
|         1 | GUERREIRO | RS     |
|         2 | GABIGOL   | RJ     |
|         3 | GANSO     | RJ     |
|         4 | NENÊ      | RJ     |
|         5 | LOVE      | SP     |
+-----------+-----------+--------+
*/

CREATE VIEW V_JOGADORES AS
SELECT IDJOGADOR, NOME, ESTADO FROM JOGADORES;
-- SHOW TABLES;

SELECT IDJOGADOR, NOME, ESTADO FROM V_JOGADORES;
/*
+-----------+-----------+--------+
| IDJOGADOR | NOME      | ESTADO |
+-----------+-----------+--------+
|         1 | GUERREIRO | RS     |
|         2 | GABIGOL   | RJ     |
|         3 | GANSO     | RJ     |
|         4 | NENÊ      | RJ     |
|         5 | LOVE      | SP     |
+-----------+-----------+--------+
*/
DELETE FROM V_JOGADORES WHERE NOME = 'GUERREIRO';

INSERT INTO V_JOGADORES VALUES(6, 'GUERREIRO', 'RS');
-- IDCLIENTE, NOME, SEXO, `E-MAIL`, NUMERO, TIPO, BAIRRO, CIDADE, ESTADO 

 -- SELEÇÃO 
SELECT IDCLIENTE, NOME, SEXO, `E-MAIL`, NUMERO, TIPO, BAIRRO, CIDADE, ESTADO
FROM V_RELATORIO 
WHERE SEXO = 'F';

