/*1.�������ݿ�*/
create database nielei
on primary
(
name=nielei,
filename='d:\data\nielei.mdf',
size=200mb,
maxsize=500mb,
filegrowth=10%
)
log on
(
name=nielei_log,
filename='d:\data\nielei.ldf',
size=5mb,
maxsize=100mb,
filegrowth=10%
)
go
/*�����ݿ�*/
use nielei
go
/*����ѧ���ɼ���*/
create table xscj
(
	xh int primary key as ѧ��,
	xm varchar(8) not null as ����, 
	xb char(2) not null as �Ա�,
	bj varchar(10) not null as �༶,
	zy varchar(15) not null as רҵ,
	yx varchar(15) not null as ������ѧԺ,
    cj NUMERIC(5,1) as �ɼ�
)
go
/*��������*/
insert into xscj(xh,xm,xb,bj,zy,yx,cj) values('10001','����','��','����1','����',86.5)
