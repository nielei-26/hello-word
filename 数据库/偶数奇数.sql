/*-------------�������ݿ�-----------------*/
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
/*�����ݿ�*/
use student
go

/*����xscj���ݱ�*/
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
/*��������*/
insert into xscj(xh,xm,xb,bj,zy,cj) values('10001','����','��','����1','����',86.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10002','������','��','����1','����',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10003','����','Ů','���1','���',78.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','����','Ů','����2','����',100)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','��','����3','����',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','Ů','����4','����',63)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','Ů','���1','���',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','Ů','���1','���',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','Ů','���2','���',81)

/*����cj��*/
create table cj
(cno varchar(10),
cj NUMERIC(5,1)
)

insert into cj(cno,cj) values('10001',89)
insert into cj(cno,cj) values('10001',98)
insert into cj(cno,cj) values('10002',68)
insert into cj(cno,cj) values('10002',84)
/*�ж�student���ݿ����Ƿ����*/
if exists(select * from sysobjects where name='�ɼ� cj')
print'cj���Ѵ���'
else
print'ci������'
go
/*�ж�student���ݿ����Ƿ�ɾ��*/
if exists(select * from sysobjects where name='cj')
begin
drop table cj 
print'cj����ɾ��'
end
else
print'ci������'
go
--case����һ��
select xh,xm,cj,dj=
	case
		when cj>=90 and cj<=100 then '��'
		when cj>=70 and cj<=89 then '��'
		when cj>=60 and cj<=70 then '����'
		when cj<=90 then '������'
	end
from xscj
--case��������
select xh,xm,cj,dj=
	case floor(cj/10)
		when 10 then '��'
		when 9 then '��'
		when 8 then '��'
		when 7 then '��'
		when 6 then '����'
		else  '������'
	end
from xscj
/*����1-100֮�����������ĺ�*/
declare @i int,@sum int
set @sum=0
set @i=1
while(@i<=100)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
print'1-100֮�����������ĺ�Ϊ:'
print @sum
/*���1-100֮������ż��*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2=0)
			begin
				print @i
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 
/*���1-100֮����������*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2<>0)
			begin
				print @i
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 
/*���1-100֮������ż��, ��ѭ��50������ѭ��*/
declare @i int
set @i=1
while(@i<=100)
	begin
		if(@i%2=0)
			begin
				print @i
				if(@i=50)
					break
				set @i=@i+1
			end
		else set @i=@i+1
	end
go 