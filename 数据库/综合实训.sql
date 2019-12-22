--1.创建一个名称为stu_1的数据库
create database  stu_1
--2.创建一个名称为stu_2的数据库
create database  stu_2
--3.在D盘向数据库stu_2中添加一个初始大小为2MB的数据文件，文件按5%自动增长
use master
alter database stu_2
add file
(
name=data_file,
filename='d:\data_file.ndf',
size=2mb,
filegrowth=5%
)
go
/*4.在stu_1数据库下创建一张学生表student（xh,xm,csrq）
		字段		类型
		xh	   	整型          --学号
		xm		   字符型			--姓名
		csrq      日期型			--出生日期
	要求：把xh 设置成主键， xm不允许为空。*/
use stu_1
go
create table student
(xh int primary key,
xm varchar(20),
csrq datetime
)
go
/*5. 在stu_1数据库下创建一张学生成绩表xscj(xh,cj)
字段		类型
		xh	   	整型			--学号
		cj		   浮点型		--成绩
要求：把xh 设置成主键*/
use stu_1
go
create table xscj
(xh int primary key,
cj float
)
go
--6.在学生表student上增加一个性别（xb）列和班级（bj）列
alter table student add xb char(2)
alter table student add bj varchar(20)
--7.在学生表student上删除班级（bj）列
alter table student drop column bj
--8.把student表名改成stu_info
exec sp_rename 'student','stu_info'
--9.将stu_info表中的列名xm修改成username
exec sp_rename 'stu_info.xm','username'
--10.向表stu_info插入两条数据
insert into stu_info(xh,username,csrq,xb) values('1001','张三','1998-5-20','女')
insert into stu_info(xh,username,csrq) values('1002','张三','1998-5-20')
insert into stu_info(xh,username,csrq) values('1003','李四','1999-5-20')
select * from stu_info
--11.向表xscj插入两条数据
insert into xscj values('1001',89)
insert into xscj values('1002',89)
insert into xscj values('1003',89)
insert into xscj values('1004',89)
--12.把表stu_info中姓名为“张三”的学生的性别改成“男”
update stu_info set xb='男' where username='张三'
update stu_info set xb='女' where username='李四'
--13.查询stu_info表中所有姓张的学生信息
select * from stu_info where username like '张%'
--14.查询stu_info表时过滤表中重复数据。
select distinct username from stu_info
select username from stu_info where username='张三'
select distinct username from stu_info where username='张三'
--15.查询stu_info前2条数据
select top 2 * from stu_info
--16.查询stu_info表，只显示username（别名为姓名）和xb（别名为性别）两个字段
select username as 姓名,xb as 性别 from stu_info
--17.查询stu_info表中学生在xscj表中的成绩
select stu_info.xh as 学号,username as 姓名,cj as 成绩 from stu_info
join xscj
on stu_info.xh=xscj.xh
--18.在表stu_info中删除所有女生信息
delete from stu_info where xb='女'
--19.获取所有的数据库名
select name from master.dbo. sysdatabases
--20.获取所有的表名
select name from sysobjects  --查询所有的表
select name from sysobjects where xtype='u' --查询用户表
select name from sysobjects where xtype='s' --查询系统表
--21.删除表
Drop table stu_info
--22.删除数据库stu_2
DROP DATABASE stu_2
