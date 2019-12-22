/*------------------触发器练习题代码------------------*/
create database student
go
use student
go
--例1. 创建表s1、s2，其中s1(xh,xm)、s2(xh,xm,cj)
create table s1
(xh varchar(20),
xm varchar(20))
go
create table s2
(xh varchar(20),
xm varchar(20),
cj float)
go
--例2. insert触发器：为S1表创建名为myInserte 的insert触发器，实现向表s1插入数据时启动触发器向表s2插入数据
create trigger myInserte
on s1
for insert
as
declare @xh varchar(20)
declare @xm varchar(20)
select @xh=xh from inserted
select @xm=xm from inserted
insert into s2 values(@xh,@xm,0)
go
--查询s1、s2表显示为空表select * from s1select * from s2go--向表s1中插入数据
insert into s1 values('1001','张三')
insert into s1 values('1002','李四')
go
--查询s2、s2表显示刚插入的数据*/
select * from s1
select * from s2
--例3. update触发器：为S1表创建一个名为myUpdate的update触发器，当对该表的“xm”列修改时激发该触发器，使用户不能修改“xm”列。
create trigger myUpdate
on s1
for update
as
if update(xm)
	begin 
		rollback transaction
		print'不能修改姓名信息'  
	end
go    
 --撤消修改操作print '不能修改学生姓名信息'endgo --修改xm信息，测验myUpdate触发器
 update s1 set xm='王五' where xm='张三'
 go
 --例4. delete触发器：为S1创建一个名为myDelete的delete触发器，实现对表s1删除数据时启动触发器同时删除表s2中对应的数据
create trigger myDelete
on s1
for delete
as
declare @xh varchar(20)
select @xh=xh from deleted
delete s2 where xh=@xh
/*删除表s1中的数据*/
delete s1 where xh='1001'
/*查询s2、s2表显示刚删除操作后的数据*/
select * from s1
select * from s2
--例5. 查看S1表中的触发器信息
execute sp_helptrigger s1
--例6. 删除mydelete触发器
drop trigger mydelete