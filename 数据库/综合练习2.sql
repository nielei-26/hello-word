/*1.创建数据库*/
create database student
on primary
(
name=student,
filename='d:\data\student.mdf',
size=100mb,
maxsize=500mb,
filegrowth=10%
)
log on
(
name=student_log,
filename='d:\data\student.ldf',
size=5mb,
maxsize=100mb,
filegrowth=10%
)
go
/*.打开数据库*/
use student
go
/*2.添加数据文件*/
use master
go
alter database student
add file
(
name=student_data,
filename='d:\data\student_data.ndf',
size=5mb,
filegrowth=10%
)
go
/*3.添加两个日志文件*/
use master
go
alter database student
add log file
(
name=student1_log,
filename='d:\data\student1_log.ldf',
size=5mb,
filegrowth=10%
),
(
name=student2_log,
filename='d:\data\student2_log.ldf',
size=5mb,
filegrowth=10%
)
go
--4.把student主数据文件初始大小修改成400MB
alter database student
modify file
(
name=student,
size=400mb
)
go
--5.将student重命名成student_info
EXEC sp_renamedb 'student','student_info'
go
--6.创建数据表xscj(xh,xm,bj,cj)
create table xscj
(xh int primary key not null,
xm varchar(10) not null,
bj varchar(20) not null,
cj numeric(5,1)
)
go
--7.查询xscj表，按cj字段降序排序,再按xh升序排序
select*from xscj order by cj desc, xh asc
--8.按班级分别统计xscj表中的平均分、最高分和最低分。
select bj as 班级,avg(cj) as 平均成绩, Max(cj) AS 最高分,Min(cj) AS 最低分 from xscj group by bj
--9.删除xscj表中所有非网络专业的学生信息
DELETE from xscj where zy  not in('网络')
--10.清空xscj表中的数据
DELETE from xscj
--11.删除xscj表
drop table xscj
