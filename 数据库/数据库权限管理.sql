create database student
go
use student
go
--创建表
create table st
(xh varchar(20),
xm varchar(20))
go
insert into st values('1001','张三')
--授权CRACT（数据库用户aa，登陆名bb）
--把st表的查询和插入权限授予aa用户
create login bb --创建登录名
with password='123',
default_database=student
go
create user aa for login bb --创建数据库用户aa
go
--给用户aa授予st查询和插入权限
grant select,insert on st to aa
go
--检测
select * from st --操作成功
insert into st values('1002','AA') --操作成功
delete st   --操作不成功
update st set xm='BB' where xh='1002' --操作不成功
go
--拒绝权限deny
deny insert on st to aa
go
--检测
insert into st values('1003','CC') --操作结果拒绝
--撤销权限revoke
--收回select,insert权限
revoke select,insert on st from aa
go
--检测
select * from st --操作不成功
insert into st values('1002','AA') --操作不成功
go


/*创建架构*/
create schema my_schena
authorization aa
go

