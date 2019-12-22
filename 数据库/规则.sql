/*-------------�������ݿ�-----------------*/
CREATE  DATABASE  student
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
--1.��������(������rule_s):�������@s��ȡֵ��Χ��0--100֮��
create rule rule_s
as
@s>=0 and @s<=100
go
--2.��������
insert into xscj(xh,xm,xb,bj,zy,cj) values('10010','A5','Ů','���2','���',150)
select * from xscj
execute sp_bindrule 'rule_s' ,'xscj.cj'
insert into xscj(xh,xm,xb,bj,zy,cj) values('10011','A5','Ů','���2','���',-10)
go
--�������
exec sp_unbindrule 'xscj.cj'
--4.�鿴����
exec sp_help 'rule_s'
--5.ɾ������
drop rule rule_s
/*Ĭ����ϰ*/
--1.����Ĭ�϶���
create default def_zy as '���缼��'
--2.Ĭ��ֵ�����
exec sp_bindefault 'def_zy','xscj.zy'
insert into xscj(xh,xm,xb,bj,cj) values('10013','A5','Ů','���2',60)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10014','A5','Ů','���2','aaa',60)
select * from xscj
--3.���Ĭ��ֵ�����
exec sp_unbindefault 'xscj.zy'
--4.ɾ��Ĭ�϶���
drop default def_zy
