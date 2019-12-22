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
go
/*-----------------------�洢������ϰ-----------------------------*/
--��1���������������Ĵ洢���̣�ʵ�ֲ�ѯxscj������������Ϣ
create proc p
as
select * from xscj where xb='��'
go
--��2�������������Ĵ洢���̣����Ա��ѯxscj���е���Ϣ
create proc p1
@sex varchar(2)
as
select *  from xscj where xb=@sex
go
--��3��������1�������Ĵ洢����
exec p
go
--��4��������2�������Ĵ洢����
exec p1 'Ů'
exec p1 '��'
go
--��5���޸Ĵ洢���̣�����1�еĴ洢����p�Ĺ����޸ĳɲ�ѯ���ڵ��ڸ���������ѧ����Ϣ
alter proc p
@cj numeric(5,1)
as
select * from xscj where cj>=@cj
go
--����p
exec  p 90
go
--��6���鿴�洢������Ϣ
exec sp_help p
--��7��ɾ���洢����p��p1ģ��10�洢������ϰ�洢�����봥����
drop proc p,p1