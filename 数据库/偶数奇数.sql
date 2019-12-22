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

/*创建cj表*/
create table cj
(cno varchar(10),
cj NUMERIC(5,1)
)

insert into cj(cno,cj) values('10001',89)
insert into cj(cno,cj) values('10001',98)
insert into cj(cno,cj) values('10002',68)
insert into cj(cno,cj) values('10002',84)
/*判断student数据库中是否存在*/
if exists(select * from sysobjects where name='成绩 cj')
print'cj表已存在'
else
print'ci表不存在'
go
/*判断student数据库中是否删除*/
if exists(select * from sysobjects where name='cj')
begin
drop table cj 
print'cj表已删除'
end
else
print'ci表不存在'
go
--case方法一：
select xh,xm,cj,dj=
	case
		when cj>=90 and cj<=100 then '优'
		when cj>=70 and cj<=89 then '良'
		when cj>=60 and cj<=70 then '及格'
		when cj<=90 then '不及格'
	end
from xscj
--case方法二：
select xh,xm,cj,dj=
	case floor(cj/10)
		when 10 then '优'
		when 9 then '优'
		when 8 then '良'
		when 7 then '中'
		when 6 then '及格'
		else  '不及格'
	end
from xscj
/*计算1-100之间所有整数的和*/
declare @i int,@sum int
set @sum=0
set @i=1
while(@i<=100)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
print'1-100之间所有整数的和为:'
print @sum
/*输出1-100之间所有偶数*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2=0)
			begin
				print @i
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 
/*输出1-100之间所有奇数*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2<>0)
			begin
				print @i
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 
/*输出1-100之间所有偶数, 在循环50次跳出循环*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2=0)
			begin
				print @i
				if(@i=50)
					break
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 