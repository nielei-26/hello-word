*--------------简单查询--------------*/
/*创建数据库*/
create database student
go
/*打开数据库*/
use student
go
/*创建数据表*/
create table stu_xscj 
(
	xh int primary key,
	xm varchar(8) not null,
	xb char(2) not null,
	bj varchar(10) not null,
	zY varchar(15) not null,
    cj NUMERIC(5,1)
)
go
/*插入单行数据*/
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10001','张三','男','网络2','网络',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10002','张三','男','网络2','网络',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10003','李四','男','网络3','网络',93.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10004','王五','男','网络4','网络',94)
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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','王五','女','网络2','网络',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','男','网络3','网络',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','女','网络4','网络',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','女','会计1','会计',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','女','会计1','会计',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','女','会计2','会计',null)
go

select xh,xm,cj
	from xscj
	order by xh
		offset 2 rows
	fetch next 5 rows only
