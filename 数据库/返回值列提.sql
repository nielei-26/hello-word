/*-------------�������ݿ�-----------------*/
CREATE  DATABASE  student
 ON PRIMARY
(
NAME=student,
FILENAME='c:\student.mdf',
SIZE=10mb,
MAXSIZE=100mb,
FILEGROWTH=10%
)
Log ON
(
NAME=student_log,
FILENAME=c:\student_log.ldf',
SIZE=10mb,
MAXSIZE=100mb,
FILEGROWTH=10%
)

go
/*�����ݿ�*/
use student
go

create table cj
(cno varchar(10),
cj NUMERIC(5,1)
)

insert into cj(cno,cj) values('10001',89)
insert into cj(cno,cj) values('10001',98)
insert into cj(cno,cj) values('10002',68)
insert into cj(cno,cj) values('10002',84)


/*1.�������ֵ����:���γ̼���ѧ���ɼ���ƽ��ֵ*/
/*��������*/
create function average(@cno char(5))
returns float
as
begin
	declare @aver float
	select @aver=(select avg(cj) from cj where cno=@cno)
	return @aver
end
go
--���ñ���ֵ����
declare @course char(5)
set @course='10001'
exec(' dbo.average(@course) as ƽ����')
go
select * from cj