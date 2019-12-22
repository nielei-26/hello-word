create database student
use student
create table zy
(zyid int primary key,
zyname varchar(20) not null
)
/*插入数据*/
insert into zy(zyid,zyname) values(1001,'网络')
insert into zy(zyid,zyname) values(1002,'软件')
insert into zy(zyid,zyname) values(1003,'信管')
insert into zy(zyid,zyname) values(1004,'大数据')
insert into zy(zyid,zyname) values(1005,'物联网')
go
select * from zy
/*显示提交事务*/
set xact_abort on
begin transaction
insert into zy(zyid,zyname) values(1006,'网络')
insert into zy(zyid,zyname) values(1007,'网络')
insert into zy(zyid,zyname) values(1006,'网络')
commit
go
select * from zy
go
insert into zy(zyid,zyname) values(1006,'网络')
insert into zy(zyid,zyname) values(1007,'网络')
insert into zy(zyid,zyname) values(1006,'网络')
go
/*查看当前锁*/
execute sp_lock