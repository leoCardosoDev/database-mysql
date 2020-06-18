DELIMITER $

DESC V_RELATORIO$

/*
mysql> DESC V_RELATORIO$
+-----------+-------------------------+------+-----+---------+-------+
| Field     | Type                    | Null | Key | Default | Extra |
+-----------+-------------------------+------+-----+---------+-------+
| IDCLIENTE | int                     | NO   |     | 0       |       |
| NOME      | varchar(30)             | NO   |     | NULL    |       |
| SEXO      | enum('M','F')           | NO   |     | NULL    |       |
| E-MAIL    | varchar(50)             | NO   |     |         |       |
| TIPO      | enum('RES','COM','CEL') | NO   |     | NULL    |       |
| NUMERO    | varchar(10)             | NO   |     | NULL    |       |
| BAIRRO    | varchar(30)             | NO   |     | NULL    |       |
| CIDADE    | varchar(30)             | NO   |     | NULL    |       |
| ESTADO    | char(2)                 | YES  |     | NULL    |       |
+-----------+-------------------------+------+-----+---------+-------+
*/

SELECT IDCLIENTE, NOME, SEXO, `E-MAIL` FROM V_RELATORIO$

DELIMITER ;