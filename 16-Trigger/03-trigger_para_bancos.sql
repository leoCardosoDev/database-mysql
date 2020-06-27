show databases;
create database loja;
use loja;
create table produto(
  idproduto int primary key auto_increment,
  nome varchar(30),
  valor float(10,2)
);

create database backup;
use backup;
create table bkp_produto(
  idbkp int primary key auto_increment,
  idproduto int,
  nome varchar(30),
  valor float(10,2)
);

status

use loja;
-- dentro do banco loja, inserindo no banco bkp
insert into backup.bkp_produto values(null, 1000, 'testes', 0.0);
select idbkp, idproduto, nome, valor from backup.bkp_produto;

-- criando a trigger para sicronizar bancos
delimiter $
create trigger backup_product
before insert on produto
for each row
begin
  insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);
end
$
delimiter ;

insert into produto values(null, 'Modelagem de Banco de Dados', 24.99);
insert into produto values(null, 'Modelagem de UML', 55.56);
insert into produto values(null, 'Livro Clean Archeture', 42.43);
insert into produto values(null, 'Livro Flutter', 55.62);
select idproduto, nome, valor from produto;
select idbkp, idproduto, nome, valor from backup.bkp_produto;

delimiter $
create trigger backup_product_del
before delete on produto
for each row
begin
  insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor);
end
$
delimiter ;

delete from produto where idproduto = 2;

