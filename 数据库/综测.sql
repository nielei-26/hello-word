create database stu_1
go
create database stu_2
ON PRIMARY
(
NAME=stu_2,
FILENAME='D:\stu_2.mdf',
SIZE=2mb,
MAXSIZE=10mb,
FILEGROWTH=5%
)
Log ON
(
NAME=stu_2_log,
FILENAME='d:\stu_2_log.ldf',
SIZE=2mb,
MAXSIZE=10mb,
FILEGROWTH=5%
)

go

use stu_1
go

create table student
(
xh int primary key not null,
xm varchar(20) not null,
csrp datetime
)
go

create table xscj
(xh int primary key ,
cj float
)
go

alter table student
add xb bit,
bj varchar(20)
go

alter table student drop column bj
go

exec sp_rename 'student','stu_info'
go

EXEC sp_rename 'stu_info.xm', 'username', 'COLUMN'
go

select * from stu_info
go

insert into stu_info(xh,username,csrq,xb) values('0409170326','聂磊',19960503,'男')
insert into stu_info(xh,username,csrq,xb) values('123456','张三',1995,'女')

insert into xscj(xh, cj) values(0409170326 ,90.9)
insert into xscj(xh, cj) values(123456 ,90.9)

alter table stu_info(xb) change "女" where username="张三"

select * from student where username=张*

select distinct * into  from stu_info

select top 2 from stu_info

select username, xb from stu_info where 

select cj from student

del * from stu_info where xb="女"
show databases
show tables
dorp database stu_2