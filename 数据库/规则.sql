/*-------------创建数据库-----------------*/
CREATE  DATABASE  student
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
--1.创建规则(规则名rule_s):定义变量@s的取值范围在0--100之间
create rule rule_s
as
@s>=0 and @s<=100
go
--2.创建规则
insert into xscj(xh,xm,xb,bj,zy,cj) values('10010','A5','女','会计2','会计',150)
select * from xscj
execute sp_bindrule 'rule_s' ,'xscj.cj'
insert into xscj(xh,xm,xb,bj,zy,cj) values('10011','A5','女','会计2','会计',-10)
go
--解除规则
exec sp_unbindrule 'xscj.cj'
--4.查看规则
exec sp_help 'rule_s'
--5.删除规则
drop rule rule_s
/*默认练习*/
--1.创建默认对象
create default def_zy as '网络技术'
--2.默认值对象绑定
exec sp_bindefault 'def_zy','xscj.zy'
insert into xscj(xh,xm,xb,bj,cj) values('10013','A5','女','会计2',60)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10014','A5','女','会计2','aaa',60)
select * from xscj
--3.解除默认值对象绑定
exec sp_unbindefault 'xscj.zy'
--4.删除默认对象
drop default def_zy
