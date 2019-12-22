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

/*创建cj表*/
create table cj
(cno varchar(10),
cj NUMERIC(5,1)
)

insert into cj(cno,cj) values('10001',89)
insert into cj(cno,cj) values('10001',98)
insert into cj(cno,cj) values('10002',68)
insert into cj(cno,cj) values('10002',84)

--1.定义一个局部变量@yx，利用set语句给变量赋值为“大数据与信息产业学院”,并输入变量的值。
declare @yx varchar(20)
set @yx='大数据与信息产业学院'
print @yx
--或者
select @yx

--2. 定义一个局部变量@xm，利用select语句，把表中学号为1001的学生姓名赋给变量，并输出变量的值。
declare @xm varchar(20)
select @xm=xm from xscj where xh='10001'
print @xm
go

--3. 查询xscj表中xb字段的长度
select COL_LENGTH('xscj','xm') as 性别字段长度

--4.截取xscj表中xm字段最左边的1个字符
select left(xm,1) as 截取姓名第一个字符 from xscj
--截取xscj表中xm字段最右边的1个字符
select right(xm,1) as 截取姓名第一个字符 from xscj

--5. 获取当前系统日期，并分别取出年月日
select getdate() as 当前日期,year(getdate()) as 年,month(getdate()) as 月,day(getdate()) as 日

--6.返回0到1之间的随机数
print rand()
--0到1的随机数且保留两位小数
print round(rand(),2)

--7.返回“Hello”首字符ASCII代码值
print ascii('Hello')

--8. 返回字符串“Hello”字符个数
print len('Hello')

--9. 将字符串“Hello”全部字符转换成小写
print lower('Hello')

--10. 将字符串“Hello”全部字符转换成大写
print upper('Hello')

--11. 将字符串“Hello”中的“ll”替换大写的“LL”
print replace('Hello','ll','LL')

--12. 取出字符串“Hello”左边连续的3个字符。
print left('Hello',3)

--13. 取出字符串“Hello”右边连续的3个字符。
print right('Hello',3)

--14.在2019年11月25日这个日期上加2天
select dateadd(day,2,'2019-11-25')

--15.返回2019年1月1日到2019年11月25日两个日期的间隔天数。
print datediff(day,'2019-1-1','2019-11-25')

--16.返回2019年5月1日指定的日期是星期几
print datename(weekday,'2019-5-1')

--17.返回2019年5月1日指定的日期是当年的第几周
print datename(week,'2019-5-1')

--18.编写并调用标量值函数。
--（1）编写标量值函数：按指定的课程号计算学生该课程成绩的平均值。
create function average(@cno varchar(10))
returns float
as
begin
	declare @aver float
	select @aver=(select avg(cj) from cj where cno=@cno)
	return @aver
end
--（2）调用标量值函数
declare @cno varchar(10)
set @cno='10001'
select dbo.average(@cno) as 平均值

--19. 编写并调用内嵌表值函数
--（1）返回同一个班级的学生成绩
create function xscj_bj(@bj varchar(10))
returns table
as
return(select * from xscj where bj=@bj)
--（2）调用内嵌表值函数
select * from dbo.xscj_bj('网络3')

--20.根据变量中的值输出结果
--如果变量tq中的值为“天晴”，则输出“不需要带雨伞”
--如果变量tq中的值为“下雨”，则输出“需要带雨伞”
declare @tq varchar(10)
set @tq='天晴'  --set @tq='下雨'
if(@tq='天晴')
	print '不需要带雨伞'
else
	print '需要带雨伞'
go

--21.用case语句，在xscj表中，把成绩大于等于90分的设为优、大于等于80分且小于90分的设为良，大于等于70分且小于80分的设为中，大于等于60分且小于70分的设为及格，小于60分的设为不及格。
--方法一：
select xh,xm,cj,dj=
	case
		when cj>90 then '优'
		when cj>80 and cj<90 then '良'
		when cj>70 and cj<80 then '中'
		when cj>60 and cj<70 then '及格'
		else '不及格'
	end
from xscj
--方法二：
select xh,xm,cj,dj=
	case floor(cj/10) --成绩除以10，取下整
		when 10 then '优'
		when 9 then '优'
		when 8 then '良'
		when 7 then '中'
		when 6 then '及格'
		else '不及格'
	end
from xscj
--22.分别输出1到100之间的偶数和奇数
declare @i int
set @i=1
print '输出1到100之间的偶数'
while(@i<=100)
	begin
		if(@i%2=0)
			begin
		print @i
		set @i=@i+1
			end
		else
			set @i=@i+1
	end
--输出1到100之间的奇数
declare @i int
set @i=1
print '输出1到100之间的奇数'
while(@i<=100)
	begin
		if(@i%2<>0)
			begin
		print @i
		set @i=@i+1
			end
		else
			set @i=@i+1
	end
--23. 计算1到50之间所有整数的和
declare @i int,@sum int
set @sum=0
set @i=1
while(@i<=50)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
	print '计算1到50之间所有整数的和为：'
	print @sum