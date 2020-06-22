SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;

/*
+--------------------+
| Tables_in_comercio |
+--------------------+
| ALUNOS             |
| CLIENTE            |
| ENDERECO           |
| JOGADOR            |
| JOGADORES          |
| PESSOA             |
| PRODUTO            |
| TELEFONE           |
| TIME               |
| TIMES              |
| v_jogadores        |
| v_relatorio        |
| VENDEDORES         |
+--------------------+
*/
DROP TABLE ENDERECO;
DROP TABLE TELEFONE;
DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
  IDCLIENTE INT,
  NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
  IDTELEFONE INT,
  TIPO CHAR(3) NOT NULL,
  NUMERO VARCHAR(10) NOT NULL,
  ID_CLIENTE INT 
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
PRIMARY KEY(IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);

SHOW CREATE TABLE TELEFONE;
/*
| TELEFONE | CREATE TABLE `TELEFONE` (
  `IDTELEFONE` int DEFAULT NULL,
  `TIPO` char(3) NOT NULL,
  `NUMERO` varchar(10) NOT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  KEY `FK_CLIENTE_TELEFONE` (`ID_CLIENTE`),
  CONSTRAINT `FK_CLIENTE_TELEFONE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`IDCLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
*/


-- DICIONARIOS DE DADOS
SHOW DATABASES;

USE INFORMATION_SCHEMA;
STATUS;
SHOW TABLES;

-- TABLE_CONSTRAINTS 
DESC TABLE_CONSTRAINTS;
/*
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_SCHEMA  | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | YES  |     | NULL    |       |
| TABLE_NAME         | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+
*/

-- CONSTRAINT_NAME

SELECT 
CONSTRAINT_SCHEMA AS 'BANCO',
TABLE_NAME AS 'TABELA',
CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS;

SELECT 
CONSTRAINT_SCHEMA AS 'BANCO',
TABLE_NAME AS 'TABELA',
CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'COMERCIO';


SELECT 
CONSTRAINT_SCHEMA AS 'BANCO',
TABLE_NAME AS 'TABELA',
CONSTRAINT_NAME AS 'NOME REGRA',
CONSTRAINT_TYPE AS 'TIPO'
FROM TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

/*
+----------+------------+---------------------+-------------+
| BANCO    | TABELA     | NOME REGRA          | TIPO        |
+----------+------------+---------------------+-------------+
| COMERCIO | PRODUTO    | PRIMARY             | PRIMARY KEY |
| COMERCIO | VENDEDORES | PRIMARY             | PRIMARY KEY |
| COMERCIO | PESSOA     | PRIMARY             | PRIMARY KEY |
| COMERCIO | PESSOA     | COLUNA4             | UNIQUE      |
| COMERCIO | TIME       | PRIMARY             | PRIMARY KEY |
| COMERCIO | JOGADOR    | PRIMARY             | PRIMARY KEY |
| COMERCIO | TIMES      | PRIMARY             | PRIMARY KEY |
| COMERCIO | CLIENTE    | PRIMARY             | PRIMARY KEY |
| COMERCIO | TIME       | time_ibfk_1         | FOREIGN KEY |
| COMERCIO | TIMES      | times_ibfk_1        | FOREIGN KEY |
| COMERCIO | TELEFONE   | FK_CLIENTE_TELEFONE | FOREIGN KEY |
+----------+------------+---------------------+-------------+
*/

USE COMERCIO;
-- APAGANDO CONSTRAINTS
ALTER TABLE TELEFONE 
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;



