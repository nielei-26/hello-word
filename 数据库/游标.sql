/*--------------简单查询--------------*/
/*创建数据库*/
create database student
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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10001','张三','男','网络1','网络',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10002','张三','男','网络1','网络',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10003','李四','女','软件1','软件',78.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','王五','女','网络2','网络',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','男','网络3','网络',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','女','网络4','网络',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','女','会计1','会计',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','女','会计1','会计',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','女','会计2','会计',null)
go
select * from xscj
go
/*创建滚动游标*/
declare my_cursor cursor scroll
for 
select * from xscj
go
--打开游标
open my_cursor
--提取数据
fetch next from my_cursor
fetch last from my_cursor
fetch prior from my_cursor
fetch next from my_cursor
fetch first from my_cursor
fetch absolute 5 from my_cursor
fetch relative -5 from my_cursor
--修改当前游标指定行的数据
update xscj set cj=100 where current of my_cursor
update xscj set cj=10 where current of my_cursor
--删除当前游标指定行数据
delete xscj  where current of my_cursor
--关闭游标
close my_cursor
--释放游标
deallocate my_cursor
