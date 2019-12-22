/*创建数据库*/
create database nielei
on primary
(
name=nielei,
filename='d:\data\nielei.mdf',
size=5mb,
maxsize=10mb,
filegrowth=10%
)
log on
(
name=nielei_log,
filename='d:\data\nielei.ldf',
size=5mb,
maxsize=10mb,
filegrowth=10%
)
go
/*打开数据库*/
use nielei
go
/*创建学生成绩表*/
create table xscj
(
	xh int primary key ,
	xm varchar(8) not null , 
	xb char(2) not null ,
	zy varchar(15) not null ,
	yx varchar(15) not null ,
    cj NUMERIC(5,1) 
)
go
/*2.插入数据*/
insert into xscj(xh,xm,xb,zy,yx,cj)
values(0409170326,'聂磊','男','网络','大数据学院',92.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10001,'张三','男','网络','大数据学院',93.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10002,'王五','男','网络','大数据学院',94.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10003,'赵六','女','网络','大数据学院',95.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10004,'小明','女','网络','大数据学院',96.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10005,'小刚','男','网络','大数据学院',97.5)
go
/*别名*/
select xh as 学号,xm as 姓名,zy as 网络技术,yx as 大数据学院,cj as 成绩 from xscj
/*把学号为0409170326的学生成绩改为85*/
update xscj
set cj=85
where xh=0409170326
go
select * from xscj where xh=0409170326
go
/*查询 xscj表中所有的信息*/
Select *  from xscj
/*查询xscj表中“xh”、“xm”、“yx”、“cj” 各字段的信息，字段名用中文别名*/
select xh as 学号,xm as 姓名,zy as 网络技术,yx as 大数据学院,cj as 成绩 from xscj
/*查询学生成绩表(xscj)中“xh”、“xm”、“yx”、“cj” 、字段的信息，且cj*(1+10%)作为结果显示*/
Select xh,xm,yx,cj*1.1 as cj from xscj
/*查询全部男生的信息*/
Select * from xscj where xb='男'
/*查询成绩在60到100之间的学生信息*/
Select * from xscj where cj>=60 and cj<=100
/*查询姓张的学生信息*/
Select * from xscj where xm like'张%'
/*查询学生信息,按成绩升序排序*/
select * from xscj order by cj  asc
/*使用聚合函数求xscj表中最高分和最低分*/
/*查询专业名不为‘网络’或‘软件’的学生信息*/
select * from xscj where zy  not in('网络','软件')
/*查询专业名为‘网络’或‘软件’的学生信息*/
select * from xscj where zy in('网络','软件')
/*成绩大于等于60分,并且小于等于90*/
select * from xscj where cj>=60 and cj<=90
/*只显示前3条记录*/
Select top 3 *  from xscj
/*使用聚合函数求xscj表中最高分和最低分*/
select * from xscj where cj=(select max(cj) from xscj)
select * from xscj where cj=(select min(cj) from xscj)