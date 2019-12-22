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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','王五','女','网络2','网络',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','男','网络3','网络',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','女','网络4','网络',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','女','会计1','会计',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','女','会计1','会计',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','女','会计2','会计',null)
go

/*----------select举例练习----------*/

/*1、查询 xscj表中所有的信息*/
Select *  from xscj
/*2、查询xscj表中“xh”、“xm”、“bj”、“cj” 字段的信息*/
Select xh,xm,bj,cj  from xscj
/*3、查询xscj表中“xh”、“xm”、“bj”、“cj” 各字段的信息，字段名用中文别名*/
Select xh as 学号,xm as 姓名,bj as 班级,cj as 成绩 from xscj
/*4、查询学生成绩表(xscj)中“xh”、“xm”、“bj”、“cj” 、字段的信息，且cj*(1+10%)作为结果显示*/
Select xh,xm,bj,cj*1.1 as cj from xscj
Select xh as 学号,xm as 姓名,bj as 班级,cj*1.1 as 成绩 from xscj
/*5、查询学生成绩表(xscj)中“bj”,且去掉重复信息*/
Select distinct bj from xscj
/*6、只显示前3条记录*/
Select top 3 *  from xscj
/*7、查询全部男生的信息*/
/*查询全部男生的信息或成绩大于等于90分的女生*/
select * from xscj where xb='男' or (xb='女' and  cj>=90)
/*8.成绩大于等于60分,并且小于等于90*/
select * from xscj where cj>=60 and cj<=90
/*9.成绩在60分到100分之间*/
select * from xscj where cj between 60 and 100
select * from xscj where cj>= 60 and cj<=100
/*10.查询专业名为‘网络’或‘软件’的学生信息*/
select * from xscj where zy='网络' or zy='软件'
select * from xscj where zy in('网络','软件')
/*11.查询专业名不为‘网络’或‘软件’的学生信息*/
select * from xscj where zy  not in('网络','软件')
/*12.查询姓张的学生信息*/
select * from xscj where xm like '张%'
/*13.查询成绩为NULL的学生信息*/
select * from xscj where cj is null
/*查询成绩不为NULL的学生信息*/
select * from xscj where cj is not null
/*14.查询成绩大于80分, 且性别为女的学生信息*/
select*from xscj where cj >80 and xb='女'
/*15.查询成绩小于60分或者大于90分的学生信息*/
select * from xscj where cj<60 or cj>90 or cj is null
/*16.查询学生信息,按成绩升序(asc)排序(order by)*/
select*from xscj order by cj asc
/*17.查询学生信息,按成绩降序(desc)排序(order by)*/
select*from xscj order by cj desc
/*18.查询学生信息,按成绩降序排序,学号升序排序*/
select*from xscj order by cj desc, xh asc
/*19.把成绩小于60分的学生信息查询结果保存到新表xs表中*/
select * into xs from xscj where cj<60
/*20.查询各专业的人数*/
select zy as 专业,count(zy) as 人数 from xscj group by zy 
/*20.查询各班的平均成绩*/
select bj as 班级,avg(cj) as 平均成绩 from xscj group by bj
/*查询各班的平均成绩(保留两位小数)*/
select bj as 班级,cast(avg(cj) as decimal(5,2)) as 平均成绩 from xscj group by bj
