create database student
go
use student
go
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
create table s1
(
xh varchar(20),
xm varchar(20)
)
go
create table s2
(
xh varchar(20),
xm varchar(20),
cj float
)
go
--1. 以xscj表为基表，创建一个名为view_cj的视图，实现查询成绩大于等于80分的学生信息。
create view view_cj
as
select * from xscj where cj>=80
go
--查询视图
select * from view_cj
--2.修改view_cj视图，实现查询所有女生且成绩大于等于60分的学生信息
alter view view_cj
as
select * from xscj where xb='女' and cj>=60
go
--查询视图
select * from view_cj
--3. 使用系统存储过程查看视图View_cj的信息
exec sp_helptext view_cj
go
--4. 按xh字段降序创建聚集索引（索引名：index_xscj）
create clustered index index_xscj
on xscj(xh desc)
go
--5. 查看索引index_xscj 的信息
exec sp_helpindex index_xscj
go
--6.创建不带参数的存储过程(p)：实现查询xscj表中男生的信息
create proc p
as
select * from xscj where xb='男'
go
--执行p
exec p
--7.创建带参数的存储过程(p1)：按性别查询xscj表中的信息
create proc p1
@sex varchar(2)
as
select * from xscj where xb=@sex
go
--执行p1
exec p1 '女'
exec p1 '男'
--8.调用p的储过程
exec p
--9.调用p1存储过程
exec p1 '男'
--10.修改存储过程：将存储过程p的功能修改成查询大于等于给定分数的学生信息
alter proc p
@cj float
as
select * from xscj where cj>=@cj
go
--调用p
exec p 80
--11. insert触发器：为S1表创建名为myInserte 的insert触发器，实现向表s1插入数据时启动触发器向表s2插入数据
create trigger myinserte
on s1
for insert
as
declare @xh varchar(10)
declare @xm varchar(10)
select @xh=xh from inserted
select @xm=xm from inserted
insert into s2 values(@xh,@xm,0)
go
--插入数据前查询
select * from s1
select * from s2
--向s2表插入数据
insert into s1(xh,xm) values('1001','张三')
insert into s1(xh,xm) values('1002','李四')
--插入数据后查询
select * from s1
select * from s2
--12. update触发器：为S1表创建一个名为myUpdate的update触发器，当对该表的“xm”列修改时激发该触发器，使用户不能修改“xm”列。
create trigger myUpdate
on s1
for update
as
if update(xm)
	begin
		rollback transaction --撤销修改操作
		print '不允许修改姓名'
	end
go
--修改学生姓名
update s1 set xm='赵六' where xh='1001' --事物在触发器结束，批处理已终止
update s1 set xh='1003' where xh='1001' --修改成功
select * from s1
--13. delete触发器：为S1创建一个名为myDelete的delete触发器，实现对表s1删除数据时启动触发器同时删除表s2中对应的数据
create trigger myDelete
on s1
for delete
as
declare @xh varchar(10)
select @xh=xh from deleted
delete s2 where xh=@xh
go
--删除学号为1002的学生信息
select * from s1
select * from s2
delete s1 where xh='1002'
--14. 查看S1表中的触发器信息
exec sp_helptrigger s1
--15. 删除mydelete触发器
drop trigger mydelete
--16. 创建登录名aa，密码为123，默认数据库为student，创建数据库用户名bb并映射到aa登录名，给数据库用户名bb授予查询和更新表xscj表的权限
--创建登录名aa
create login aa
with password='123',
default_database=student
go
--创建用户名bb,并映射到登录名aa上
create user bb for login aa
go
--给数据库用户授予查询和更新表xscj表的权限
grant select,update on xscj  to bb
go