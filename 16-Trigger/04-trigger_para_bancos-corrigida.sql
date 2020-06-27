show databases;
/* ERRADO
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
*/
drop trigger backup_product;
drop table backup.bkp_produto;

-- CERTO
delimiter $
create trigger backup_product_ins
after insert on produto
for each row
begin
  insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);
end
$
delimiter ;

drop table produto;
drop table backup.bkp_produto;
drop trigger backup_product_ins;

insert into produto values(null, 'Modelagem de Banco de Dados', 24.99);
insert into produto values(null, 'Modelagem de UML', 55.56);
insert into produto values(null, 'Livro Clean Archeture', 42.43);
insert into produto values(null, 'Livro Flutter', 55.62);
select idproduto, nome, valor from produto;
select idbkp, idproduto, nome, valor from backup.bkp_produto;
