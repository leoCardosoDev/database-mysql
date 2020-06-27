
alter table backup.bkp_produto
add evento char(1);

select idbkp, idproduto, nome, valor, evento from backup.bkp_produto;

drop trigger backup_product_del;
delimiter $
create trigger backup_product_del
before delete on produto
for each row
begin
  insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor, 'd');
end
$
delimiter ;

select idproduto, nome, valor from produto;

delete from produto where idproduto = 5;

drop trigger backup_product_ins;
delimiter $
create trigger backup_product_ins
after insert on produto
for each row
begin
  insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor, 'c' );
end
$
delimiter ;

insert into produto values(null, 'NodeJs', 189.99);
