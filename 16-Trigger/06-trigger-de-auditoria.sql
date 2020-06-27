-- Auditando uma tabela com trigger

drop database loja;
drop database backup;

show databases;

create database loja;
use loja;
create table produto(
  idproduto int primary key auto_increment,
  nome varchar(30),
  valor float(10,2)
);

insert into produto values(null, 'Livro Banco de Dados', 55.43);
insert into produto values(null, 'Livro UML', 84.55);
insert into produto values(null, 'Livro NodeJs', 56.67);
insert into produto values(null, 'Livro Flutter', 73.95);

select idproduto, nome, valor from produto;

create database backup;
use backup;

-- Quando e quem mexeu na tabela
select now() as 'Data';
select current_user() as 'Usuario';

create table bkp_produto(
  idbkp int primary key auto_increment,
  idproduto int,
  nome varchar(30),
  valor_original float(10,2),
  valor_alterado float(10,2),
  data datetime,
  usuario varchar(30),
  evento char(1)
);

use loja;
select idproduto, nome, valor from produto;

-- drop trigger audit_produto;
delimiter $
create trigger audit_produto_update
after update on produto
for each row
begin
  insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor, new.valor, now(), current_user, 'U' );
end
$
delimiter ;

update produto set valor = 110.45 where idproduto = 4;

select idproduto, nome, valor from produto;
select idbkp, idproduto, nome, valor_original, valor_alterado, data, usuario, evento from backup.bkp_produto; 


-- idbkp, idproduto, nome, valor_original, valor_alterado, data, usuario, evento