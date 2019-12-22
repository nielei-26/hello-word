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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','����','Ů','����2','����',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','��','����3','����',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','Ů','����4','����',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','Ů','���1','���',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','Ů','���1','���',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','Ů','���2','���',null)
go

/*----------select������ϰ----------*/

/*1����ѯ xscj�������е���Ϣ*/
Select *  from xscj
/*2����ѯxscj���С�xh������xm������bj������cj�� �ֶε���Ϣ*/
Select xh,xm,bj,cj  from xscj
/*3����ѯxscj���С�xh������xm������bj������cj�� ���ֶε���Ϣ���ֶ��������ı���*/
Select xh as ѧ��,xm as ����,bj as �༶,cj as �ɼ� from xscj
/*4����ѯѧ���ɼ���(xscj)�С�xh������xm������bj������cj�� ���ֶε���Ϣ����cj*(1+10%)��Ϊ�����ʾ*/
Select xh,xm,bj,cj*1.1 as cj from xscj
Select xh as ѧ��,xm as ����,bj as �༶,cj*1.1 as �ɼ� from xscj
/*5����ѯѧ���ɼ���(xscj)�С�bj��,��ȥ���ظ���Ϣ*/
Select distinct bj from xscj
/*6��ֻ��ʾǰ3����¼*/
Select top 3 *  from xscj
/*7����ѯȫ����������Ϣ*/
/*��ѯȫ����������Ϣ��ɼ����ڵ���90�ֵ�Ů��*/
select * from xscj where xb='��' or (xb='Ů' and  cj>=90)
/*8.�ɼ����ڵ���60��,����С�ڵ���90*/
select * from xscj where cj>=60 and cj<=90
/*9.�ɼ���60�ֵ�100��֮��*/
select * from xscj where cj between 60 and 100
select * from xscj where cj>= 60 and cj<=100
/*10.��ѯרҵ��Ϊ�����硯���������ѧ����Ϣ*/
select * from xscj where zy='����' or zy='���'
select * from xscj where zy in('����','���')
/*11.��ѯרҵ����Ϊ�����硯���������ѧ����Ϣ*/
select * from xscj where zy  not in('����','���')
/*12.��ѯ���ŵ�ѧ����Ϣ*/
select * from xscj where xm like '��%'
/*13.��ѯ�ɼ�ΪNULL��ѧ����Ϣ*/
select * from xscj where cj is null
/*��ѯ�ɼ���ΪNULL��ѧ����Ϣ*/
select * from xscj where cj is not null
/*14.��ѯ�ɼ�����80��, ���Ա�ΪŮ��ѧ����Ϣ*/
select*from xscj where cj >80 and xb='Ů'
/*15.��ѯ�ɼ�С��60�ֻ��ߴ���90�ֵ�ѧ����Ϣ*/
select * from xscj where cj<60 or cj>90 or cj is null
/*16.��ѯѧ����Ϣ,���ɼ�����(asc)����(order by)*/
select*from xscj order by cj asc
/*17.��ѯѧ����Ϣ,���ɼ�����(desc)����(order by)*/
select*from xscj order by cj desc
/*18.��ѯѧ����Ϣ,���ɼ���������,ѧ����������*/
select*from xscj order by cj desc, xh asc
/*19.�ѳɼ�С��60�ֵ�ѧ����Ϣ��ѯ������浽�±�xs����*/
select * into xs from xscj where cj<60
/*20.��ѯ��רҵ������*/
select zy as רҵ,count(zy) as ���� from xscj group by zy 
/*20.��ѯ�����ƽ���ɼ�*/
select bj as �༶,avg(cj) as ƽ���ɼ� from xscj group by bj
/*��ѯ�����ƽ���ɼ�(������λС��)*/
select bj as �༶,cast(avg(cj) as decimal(5,2)) as ƽ���ɼ� from xscj group by bj
