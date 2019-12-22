use student
go
create table stu_xscj
(
xh int primary key not null,
xm varchar(10) not null,
xb char(2) not null,
bj varchar(20) not null,
zy varchar(20) not null,
cj numeric(5,1)
)
go
/*2.插入数据*/
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10001,'张三','男','网络2','网络',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10002,'张三','男','网络2','网络',93.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10003,'王五','男','网络4','网络',94.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10004,'赵六','男','网络5','网络',95.5)
go
/*查询全部字段*/
select * from stu_xscj
go
/*查询指定字段*/
select xh ,xm ,cj  from stu_xscj
/*别名*/
select xh as 学号,xm as 姓名,cj as 成绩 from stu_xscj
/*消除重复项*/
select xm,xb,cj from stu_xscj
select distinct xm,xb,cj from stu_xscj
/*显示前2条数据*/
select top 2*from stu_xscj
/*把成绩提高10%*/
select xh as 学号,xm as 姓名,cj*1.1 as 成绩 from stu_xscj	
/*创建学生成绩表*/
create table xscj
(
xh int primary key not null,
xm varchar(10) not null,
xb char(2) not null,
bj varchar(20) not null,
zy varchar(20) not null,
cj numeric(5,1)
)
go
/*2.插入数据*/
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10001,'张三','男','网络1','网络',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10002,'张三丰','男','网络1','网络',93.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10003,'王五','男','软件1','软件',94.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10004,'赵六','男','网络2','网络',95.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10005,'A1','男','网络3','网络',96.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10006,'A2','男','网络4','网络',97.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10007,'A3','男','会计1','会计',98.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10008,'A4','男','会计2','会计',99.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10009,'A5','六','会计2','会计',null)
go
select * from xscj
select xh ,xm ,cj  from xscj
select xh as 学号,xm as 姓名,bj as 班级,cj as 成绩 from xscj
select xh as 学号,xm as 姓名,bj as 班级,cj*1.1 as 成绩 from xscj
select distinct bj from xscj
select top 3*from xscj
select*from xscj where xb='男' or cj>=96
