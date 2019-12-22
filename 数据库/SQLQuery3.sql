create table zy
(
zyid INT PRIMARY KEY NOT NULL,
zyname varchar(50) not null
)
insert into zy(zyid,zyname)
values(1001,'网络')
insert into zy(zyid,zyname)
values(1002,'软件')
insert into zy(zyid,zyname)
values(1003,'信管')
insert into zy(zyid,zyname)
values(1004,'大数据')
insert into zy(zyid,zyname)
values(1005,'物联网')
/*在xscj表中查询网络专业学生信息*/
select * from xscj where zy in(select zyname from zy )
/*在xscj表中查询成绩小于平均成绩的信息*/
select * from xscj where (select avg(cj) from xscj)>cj or cj is null
/*1.在xscj表中查询成绩小于所有软件专业学生的信息*/
select * from xscj
where cj<
all(select cj from xscj where zy='软件') or cj is null
/*在xscj表中查询成绩大于所有软件专业学生的信息*/
select * from xscj
where cj<
any(select cj from xscj where zy='软件')
/*exists运算符的子查询
1.在xscj表中查询,如体育专业存在则显示全部信息*/
select * from xscj
where exists (select * from xscj where zy='体育')
/*2.在xscj表中查询,如体育专业不存在则显示全部信息*/
select * from xscj
where not exists (select * from xscj where zy='体育')