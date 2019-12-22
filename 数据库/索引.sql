use student 
--创建S表
create table s
(
sno int not null,
primary key(sno),
sname char(10)
)
--插入数据
insert into s(sno,sname) values('1001','A')
insert into s(sno,sname) values('1002','B')
insert into s(sno,sname) values('1003','C')
--创建课程表C
create table c
(cno int not null,
primary key(cno),
cname varchar(10)
)
--插入数据
insert into c(cno,cname) values('001','数据库')
insert into c(cno,cname) values('002','C语言')
--创建sc表
create table sc
(sno int not null
 constraint s_fore foreign key references s(sno),
 cno int not null
 constraint c_fore foreign key references c(cno),
 score numeric(5,2)
 constraint sc_c_sprim primary key(sno,cno)
)
--插入数据
insert into sc(sno,cno,score) values('1001','001',86)
insert into sc(sno,cno,score) values('1004','004',89)
--创建视图
create view view_s_sc_c 
as
select s.sno,c.cno,sc.score from s
join sc on s.sno=sc.cno
join c on sc.cno=c.cno

select * from view_s_sc_c
--创建非聚集索引, sname
Create  index index_sname
on s(sname desc)
--索引重命名
EXEC SP_RENAME 's.index_sname','index_sname'
--查看s表中在索引信息
EXEC sp_helpindex s