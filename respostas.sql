
select e.nome as empregado,c.nome as chefe,e.salario as emp_sal ,c.salario as chef_sal from empregados e join empregados c on e.supervisor_id = c.emp_id where e.salario > c.salario;

select d.nome, max(e.salario) as salario from departamentos d join empregados e on d.dep_id = e.dep_id group by d.nome;


select min(e.nome), d.dep_id from empregados e join departamentos d on d.dep_id = e.dep_id where e.salario in (select max(e.salario) as salario from departamentos d join empregados e on d.dep_id = e.dep_id group by d.dep_id)group by d.dep_id;

select d.nome from departamentos d where d.dep_id in(select e.dep_id from empregados e group by e.dep_id having count(e.dep_id) < 3 );

select d.nome,count(e.dep_id) as count from departamentos d join empregados e on e.dep_id = d.dep_id group by d.nome;

select e.nome,e.dep_id from empregados e join empregados c on e.supervisor_id = c.emp_id where  not e.dep_id = c.dep_id;

select d.dep_id, sum(e.salario) as soma from departamentos d join empregados e on d.dep_id = e.dep_id group by d.dep_id;

select nome from(select nome,salario, avg(salario) over(partition by dep_id)as media from empregados)as s where salario>media;

select nome,dep_id,salario,avg(salario) over(partition by dep_id) from empregados;

select nome,salario,dep_id,media from(select nome,salario,dep_id, avg(salario) over(partition by dep_id)as media from empregados)as s where salario>=media;

select min(e.nome), d.dep_id from empregados e join departamentos d on d.dep_id = e.dep_id where e.salario in (select min(e.salario) as salario from departamentos d join empregados e on d.dep_id = e.dep_id group by d.dep_id)group by d.dep_id;