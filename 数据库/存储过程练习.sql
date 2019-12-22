/*-------------创建数据库-----------------*/
CREATE  DATABASE  student
 ON PRIMARY
(
NAME=student,
FILENAME='D:\student.mdf',
SIZE=10mb,
MAXSIZE=100mb,
FILEGROWTH=10%
)
Log ON
(
NAME=student_log,
FILENAME='d:\student_log.ldf',
SIZE=10mb,
MAXSIZE=100mb,
FILEGROWTH=10%
)

go
/*打开数据库*/
use student
go

/*创建xscj数据表*/
create table xscj
(
	xh int primary key,
	xm varchar(8) not null,
	xb char(2) not null,
	bj varchar(10) not null,
	zY varchar(15) not null,
    cj NUMERIC(5,1)
)
go
/*插入数据*/
insert into xscj(xh,xm,xb,bj,zy,cj) values('10001','张三','男','网络1','网络',86.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10002','张三丰','男','网络1','网络',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10003','李四','女','软件1','软件',78.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','王五','女','网络2','网络',100)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','男','网络3','网络',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','女','网络4','网络',63)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','女','会计1','会计',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','女','会计1','会计',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','女','会计2','会计',81)
go
/*-----------------------存储过程练习-----------------------------*/
--例1、创建不带参数的存储过程：实现查询xscj表中男生的信息
create proc p
as
select * from xscj where xb='男'
go
--例2、创建带参数的存储过程：按性别查询xscj表中的信息
create proc p1
@sex varchar(2)
as
select *  from xscj where xb=@sex
go
--例3、调用例1所创建的存储过程
exec p
go
--例4、调用例2所创建的存储过程
exec p1 '女'
exec p1 '男'
go
--例5、修改存储过程：将例1中的存储过程p的功能修改成查询大于等于给定分数的学生信息
alter proc p
@cj numeric(5,1)
as
select * from xscj where cj>=@cj
go
--调用p
exec  p 90
go
--例6、查看存储过程信息
exec sp_help p
--例7、删除存储过程p、p1模块10存储过程练习存储过程与触发器
drop proc p,p1