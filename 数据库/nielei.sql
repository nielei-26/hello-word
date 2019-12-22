/*1.创建数据库*/
create database nielei
on primary
(
name=nielei,
filename='d:\data\nielei.mdf',
size=200mb,
maxsize=500mb,
filegrowth=10%
)
log on
(
name=nielei_log,
filename='d:\data\nielei.ldf',
size=5mb,
maxsize=100mb,
filegrowth=10%
)
go
/*打开数据库*/
use nielei
go
/*创建学生成绩表*/
create table xscj
(
	xh int primary key as 学号,
	xm varchar(8) not null as 姓名, 
	xb char(2) not null as 性别,
	bj varchar(10) not null as 班级,
	zy varchar(15) not null as 专业,
	yx varchar(15) not null as 大数据学院,
    cj NUMERIC(5,1) as 成绩
)
go
/*插入数据*/
insert into xscj(xh,xm,xb,bj,zy,yx,cj) values('10001','张三','男','网络1','网络',86.5)
