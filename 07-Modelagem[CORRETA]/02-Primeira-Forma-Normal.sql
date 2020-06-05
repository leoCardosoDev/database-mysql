SHOW DATABASES;
USE PROJETO;
SHOW TABLES;
DESC CLIENTE;
SELECT NOME, CPF, EMAIL, TELEFONE, ENDERECO, SEXO FROM CLIENTE;

INSERT INTO CLIENTE(NOME, CPF, EMAIL, TELEFONE, ENDERECO, SEXO) 
VALUES('CARLA', '45639954', 'C.LOPES@UOL.COM.BR', '93001-7585', 'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER', 'F');

SELECT SEXO, COUNT(*) AS QTD FROM CLIENTE GROUP BY SEXO;

/* MODELAGEM */
/* PRIMEIRA FORMA NORMAL */
/* 3 REGRAS BÁSICAS */

/*
	1ª  REGRA
		- TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA
		EX:
			[AMARELO, AZUL, LARANJA, VERDE] => VETOR DE CORES
			[KA, FIESTA, UNO, CIVIC] => VETOR DE CARROS
			 TELEFONE 
			+-----------------------+
			
			| 978605434 - 2467 6767
	
	
	2ª REGRA
		- TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA OU QUANDO O CAMPO FOR DIVISIVEL
		EX:
		RUA 		BAIRRO 		CIDADE 		ESTADO 		=> MULTIVALORADO E DIVISIVEL
		| ENDERECO                                      
		+-----------------------------------------------+
		| MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
	
	
	3ª REGRA
		- TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE TODO O REGISTRO  COMO SENDO ÚNICO
			ISSO É O QUE CHAMAMOS DE CHAVE PRIMÁRIA OU PRIMARY KEY
			| NOME  | CPF | EMAIL | TELEFONE | ENDERECO | SEXO | => COLUNAS
			CPF SERIA UMA CANDIDATA A PRIMARY KEY -> NÃO FAÇA MODELAGEM BASEADA EM PROCEDIMENTO
				CPF É UM PROCEDIMENTO DA RECEITA FEDERAL
		TIPOS DE CHAVES
			- NATURAL => CPF
			- ARTIFICIAL => ID -> GERALMENTE AUTO-INCREMENT
*/

CREATE DATABASE COMERCIO;
USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(50) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2),
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

DROP TABLE CLIENTE;

/* ENDERECO OBRIGATÓRIO - SOMENTE */
/* TELEFONE NÃO OBRIGATÓRIO - MAIS DE UM */
/* 
	FOREIGN KEY - CHAVE ESTRANGEIRA
	É A CHAVE PRIMARIA DE UMA TABELA QUE VAI ATÉ OUTRA
	TABELA PRA FAZER REFERENCIA ENTRE REGISTROS
*/

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA + FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARÁ SEMPRE NA CARDINALIDADE N */

SHOW DATABASES;
USE COMERCIO;
SHOW TABLES;

DESC CLIENTE;
+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int(11)       | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('M','F') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+
INSERT INTO CLIENTE VALUES(NULL, 'JOAO', 'M', 'JOAO@IG.COM.BR', '111.222.333-44');
INSERT INTO CLIENTE VALUES(NULL, 'CARLOS', 'M', 'CARLOS@GLOBO.COM', '222.333.444-55');
INSERT INTO CLIENTE VALUES(NULL, 'ANA', 'F', 'ANA@GMAIL.COM', '333.444.555-66');
INSERT INTO CLIENTE VALUES(NULL, 'CLARA', 'F', NULL, '444.555.666-77');
INSERT INTO CLIENTE VALUES(NULL, 'JORGE', 'M', 'JORGE@HOTMAIL.COM', '555.666.777-88');
INSERT INTO CLIENTE VALUES(NULL, 'CELIA', 'F', 'CELIA@OUTLOOK.COM', '666.777.888-99');

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE;
+-----------+--------+------+-------------------+----------------+
| IDCLIENTE | NOME   | SEXO | EMAIL             | CPF            |
+-----------+--------+------+-------------------+----------------+
|         1 | JOAO   | M    | JOAO@IG.COM.BR    | 111.222.333-44 |
|         2 | CARLOS | M    | CARLOS@GLOBO.COM  | 222.333.444-55 |
|         3 | ANA    | F    | ANA@GMAIL.COM     | 333.444.555-66 |
|         4 | CLARA  | F    | NULL              | 444.555.666-77 |
|         5 | JORGE  | M    | JORGE@HOTMAIL.COM | 555.666.777-88 |
|         6 | CELIA  | F    | CELIA@OUTLOOK.COM | 666.777.888-99 |
+-----------+--------+------+-------------------+----------------+


DESC ENDERECO; /* 1 X 1 - RELACIONAMENTO COM A TABELA CLIENTE - OBRIGATORIO - PELO MENOS 1*/
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int(11)     | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(50) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | YES  |     | NULL    |                |
| ID_CLIENTE | int(11)     | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'B. HORIZONTE', 'MG', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRES VARGAS', 'JARDINS', 'SAO PAULO', 'SP', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA ALFANDEGA', 'ESTACIO', 'RIO DE JANEIRO', 'RJ', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA DO OUVIDOR', 'FLAMENGO', 'RIO DE JANEIRO', 'RJ', 6);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'CENTRO', 'VITORIA', 'ES', 5);

INSERT INTO ENDERECO VALUES(NULL, 'RUA BELGICA', 'CENTRO', 'SAO PAULO', 'SP', 5);

SELECT IDENDERECO, RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE FROM ENDERECO;


DESC TELEFONE;
+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int(11)                 | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(10)             | NO   |     | NULL    |                |
| ID_CLIENTE | int(11)                 | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+


