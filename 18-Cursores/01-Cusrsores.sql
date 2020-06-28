create database cursores;
user cursores;
create table vendedores(
  idvendedor int primary key auto_increment,
  nome varchar(50),
  jan int,
  fev int,
  mar int
);

insert into vendedores values(null, 'Mafra', 324, 242, 574);
insert into vendedores values(null, 'Clara', 457, 456, 755);
insert into vendedores values(null, 'Joao', 567, 785, 258);
insert into vendedores values(null, 'Lilian', 885, 953, 678);
insert into vendedores values(null, 'Antonio', 436, 464, 574);
insert into vendedores values(null, 'Gloria', 678, 786, 443);

select idvendedor, nome, jan, fev, mar from vendedores;
select nome, (jan+fev+mar) as 'Total' from vendedores;
select nome, (jan+fev+mar) / 3 as 'Media' from vendedores;

create table vend_total(
  nome varchar(50),
  jan int,
  fev int,
  mar int,
  total int,
  media float(10,2)
);

select idvendedor, nome, jan, fev, mar from vendedores;
select nome, jan, fev, mar, total, media from vend_total;
delimiter $
create procedure inseredados()
begin
  declare fim int default 0;
  declare var1, var2, var3, vtotal int;
  declare vmedia float(10,2);
  declare vnome varchar(50);

  declare reg cursor for(
    select nome, jan, fev, mar from vendedores
  );
  declare continue handler for not found set fim = 1;

  open reg;
  repeat
    fetch reg into vnome, var1, var2, var3;
    if not fim then
      set vtotal = var1 + var2 + var3;
      set vmedia = vtotal / 3;
      insert into vend_total values(vnome, var1, var2, var3, vtotal, vmedia);
    end if;
  until fim end repeat;
  close reg;
end
$
delimiter ;

select idvendedor, nome, jan, fev, mar from vendedores;
select nome, jan, fev, mar, total, media from vend_total;

call inseredados();
