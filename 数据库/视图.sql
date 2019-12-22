/*1.创建数据库*/
create database student
on primary
(
name=student,
filename='d:\data\student.mdf',
size=200mb,
maxsize=500mb,
filegrowth=10%
)
log on
(
name=student_log,
filename='d:\data\student.ldf',
size=5mb,
maxsize=100mb,
filegrowth=10%
)
go
/*1.创建数据表stu_xscj*/
create table st
(sno char(5),
cno char(5),
score numeric(3,0)
)
go
/*2.打开数据库*/
use student
go
/*2.插入数据*/
insert into st(sno, cno, score)
values(10001,'01',95)
insert into st(sno, cno, score)
values(10002,'02',95)


/*例1、使用T-SQL创建视图给学生表创建视图，视图名为View_st*/
create view view_st
as
select * from st
go
select * from st
select * from view_st
go
/*例2、使用T-SQL修改视图View_st，要求成绩大于90分*/
alter  view  view_st
as
select * from st where score>90
go

/*2.插入数据*/
insert into view_st(sno, cno, score)
values(10003,'03',91)
insert into view_st(sno, cno, score)
values(10003,'03',81)
go
select * from st
select * from view_st
go
/*例4、使用T-SQL修改视图View_st中的数据，要求把学号为1002的学生成绩修改为100分*/
update view_st set score=100 where sno='1002'
update view_st set score=100 where sno='1001'
/*把学号为1002的学生信息删除掉*/
delete view_st where sno='1002'
/*例5、使用系统存储过程查看视图View_st信息*/
exec sp_help   view_st
exec sp_helptext   view_st
/*例6、使用系统存储过程修改视图名称要求把View_st改为View_test*/
sp_rename  view_st,view_test
/*删除视图*/
drop view view_st