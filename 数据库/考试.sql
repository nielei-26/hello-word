/*�������ݿ�*/
create database nielei
on primary
(
name=nielei,
filename='d:\data\nielei.mdf',
size=5mb,
maxsize=10mb,
filegrowth=10%
)
log on
(
name=nielei_log,
filename='d:\data\nielei.ldf',
size=5mb,
maxsize=10mb,
filegrowth=10%
)
go
/*�����ݿ�*/
use nielei
go
/*����ѧ���ɼ���*/
create table xscj
(
	xh int primary key ,
	xm varchar(8) not null , 
	xb char(2) not null ,
	zy varchar(15) not null ,
	yx varchar(15) not null ,
    cj NUMERIC(5,1) 
)
go
/*2.��������*/
insert into xscj(xh,xm,xb,zy,yx,cj)
values(0409170326,'����','��','����','������ѧԺ',92.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10001,'����','��','����','������ѧԺ',93.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10002,'����','��','����','������ѧԺ',94.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10003,'����','Ů','����','������ѧԺ',95.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10004,'С��','Ů','����','������ѧԺ',96.5)
insert into xscj(xh,xm,xb,zy,yx,cj)
values(10005,'С��','��','����','������ѧԺ',97.5)
go
/*����*/
select xh as ѧ��,xm as ����,zy as ���缼��,yx as ������ѧԺ,cj as �ɼ� from xscj
/*��ѧ��Ϊ0409170326��ѧ���ɼ���Ϊ85*/
update xscj
set cj=85
where xh=0409170326
go
select * from xscj where xh=0409170326
go
/*��ѯ xscj�������е���Ϣ*/
Select *  from xscj
/*��ѯxscj���С�xh������xm������yx������cj�� ���ֶε���Ϣ���ֶ��������ı���*/
select xh as ѧ��,xm as ����,zy as ���缼��,yx as ������ѧԺ,cj as �ɼ� from xscj
/*��ѯѧ���ɼ���(xscj)�С�xh������xm������yx������cj�� ���ֶε���Ϣ����cj*(1+10%)��Ϊ�����ʾ*/
Select xh,xm,yx,cj*1.1 as cj from xscj
/*��ѯȫ����������Ϣ*/
Select * from xscj where xb='��'
/*��ѯ�ɼ���60��100֮���ѧ����Ϣ*/
Select * from xscj where cj>=60 and cj<=100
/*��ѯ���ŵ�ѧ����Ϣ*/
Select * from xscj where xm like'��%'
/*��ѯѧ����Ϣ,���ɼ���������*/
select * from xscj order by cj  asc
/*ʹ�þۺϺ�����xscj������߷ֺ���ͷ�*/
/*��ѯרҵ����Ϊ�����硯���������ѧ����Ϣ*/
select * from xscj where zy  not in('����','���')
/*��ѯרҵ��Ϊ�����硯���������ѧ����Ϣ*/
select * from xscj where zy in('����','���')
/*�ɼ����ڵ���60��,����С�ڵ���90*/
select * from xscj where cj>=60 and cj<=90
/*ֻ��ʾǰ3����¼*/
Select top 3 *  from xscj
/*ʹ�þۺϺ�����xscj������߷ֺ���ͷ�*/
select * from xscj where cj=(select max(cj) from xscj)
select * from xscj where cj=(select min(cj) from xscj)