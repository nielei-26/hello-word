create table xsxx
(
	xh varchar(10) primary key,
	xm varchar(8) not null,
)

insert into xsxx(xh,xm) values('1001','张三')
insert into xsxx(xh,xm) values('1002','李四')
insert into xsxx(xh,xm) values('1003','王五')
insert into xsxx(xh,xm) values('1004','赵六')

create table cj
(
	xh varchar(10) primary key,
    cj NUMERIC(5,1)
)

insert into cj(xh,cj) values('1001',86)
insert into cj(xh,cj) values('1002',96)
insert into cj(xh,cj) values('1005',90)
/*内连接*/
select xsxx .xh as 学号,xsxx.xm as 姓名,cj.cj as 成绩 from xsxx
join cj on xsxx.xh=cj.xh
/*左外连接*/
select xsxx .xh as 学号,xsxx.xm as 姓名,cj.cj as 成绩 from xsxx
left join cj on xsxx.xh=cj.xh
/*右外连接*/
select xsxx .xh as 学号,xsxx.xm as 姓名,cj.cj as 成绩 from xsxx
 right join cj on xsxx.xh=cj.xh
 /*全连接*/
select xsxx .xh as 学号,xsxx.xm as 姓名,cj.cj as 成绩 from xsxx
full join cj on xsxx.xh=cj.xh