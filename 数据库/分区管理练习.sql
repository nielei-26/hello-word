/*分区管理练习*/
--1、创建student数据库
create database student
go
--2、打开student数据库--
use student
go
--3.添加文件组
--语法：alter database 数据库名 add  filegroup 文件组名
--向student数据库中添加文件组fg1,fg2,  fg3,fg4
alter database student add filegroup fg1
alter database student add filegroup fg2
alter database student add filegroup fg3
alter database student add filegroup fg4
--4.向文件组中添加数据文件
--语法：alter adtabase 数据库名 add file  数据标识 to filegroup 文件组
--、分别向文件组中添加数据文件data_file1，data_file2，data_file3，data_file4
alter database student
add file
(name=data_file1,
filename='d:\data_file1.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg1
go
alter database student
add file
(name=data_file2,
filename='d:\data_file2.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg2
go
alter database student
add file
(name=data_file3,
filename='d:\data_file3.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg3
go
alter database student
add file
(name=data_file4,
filename='d:\data_file4.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg4
go
--5、创建分区函数
use student
go
create partition function myPF(datetime)
as range right
for values('1997-1-1','1998-1-1','1999-1-1')
go
--6创建分区方案
create partition scheme myPS
as partition myPF
to(fg1,fg2,fg3,fg4)
go
--7、创建分区表
create table stu_info
(
xh int identity(1,1),
xm varchar(20),
csrq datetime,
bj varchar(20)
)
on myps(csrq)
go
insert into stu_info(xm,csrq,bj) values('张三','1996-5-23','网络1')
insert into stu_info(xm,csrq,bj) values('李四','1996-4-15','网络2')
insert into stu_info(xm,csrq,bj) values('王五','1996-2-3','网络3')
insert into stu_info(xm,csrq,bj) values('张三','1996-7-12','网络4')
insert into stu_info(xm,csrq,bj) values('张三','19965-23','网络1')
go
select * from stu_info
--8、查看所有的分区边界
select * from sys.partition_range_values
--9、查询分区表编号
select $partition.myPF('1996-1-1') as 分区编号
select $partition.myPF('1997-1-1') as 分区编号
select $partition.myPF('1998-1-1') as 分区编号
select $partition.myPF('1999-1-1') as 分区编号
--10、查询分区中的数据
select * from stu_info where $partition.mypf(csrq)=1
select * from stu_info where $partition.mypf(csrq)=2
select * from stu_info where $partition.mypf(csrq)=3
select * from stu_info where $partition.mypf(csrq)=4
--11、合并（删除）分区模块
alter partition function
myPF()
merge range('1998-1-1')
go


