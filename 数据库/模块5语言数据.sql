use student
go
create table stu_xscj
(
xh int primary key not null,
xm varchar(10) not null,
xb char(2) not null,
bj varchar(20) not null,
zy varchar(20) not null,
cj numeric(5,1)
)
go
/*2.��������*/
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10001,'����','��','����2','����',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10002,'����','��','����2','����',93.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10003,'����','��','����4','����',94.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj)
values(10004,'����','��','����5','����',95.5)
go
/*��ѯȫ���ֶ�*/
select * from stu_xscj
go
/*��ѯָ���ֶ�*/
select xh ,xm ,cj  from stu_xscj
/*����*/
select xh as ѧ��,xm as ����,cj as �ɼ� from stu_xscj
/*�����ظ���*/
select xm,xb,cj from stu_xscj
select distinct xm,xb,cj from stu_xscj
/*��ʾǰ2������*/
select top 2*from stu_xscj
/*�ѳɼ����10%*/
select xh as ѧ��,xm as ����,cj*1.1 as �ɼ� from stu_xscj	
/*����ѧ���ɼ���*/
create table xscj
(
xh int primary key not null,
xm varchar(10) not null,
xb char(2) not null,
bj varchar(20) not null,
zy varchar(20) not null,
cj numeric(5,1)
)
go
/*2.��������*/
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10001,'����','��','����1','����',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10002,'������','��','����1','����',93.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10003,'����','��','���1','���',94.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10004,'����','��','����2','����',95.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10005,'A1','��','����3','����',96.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10006,'A2','��','����4','����',97.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10007,'A3','��','���1','���',98.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10008,'A4','��','���2','���',99.5)
insert into xscj(xh,xm,xb,bj,zy,cj)
values(10009,'A5','��','���2','���',null)
go
select * from xscj
select xh ,xm ,cj  from xscj
select xh as ѧ��,xm as ����,bj as �༶,cj as �ɼ� from xscj
select xh as ѧ��,xm as ����,bj as �༶,cj*1.1 as �ɼ� from xscj
select distinct bj from xscj
select top 3*from xscj
select*from xscj where xb='��' or cj>=96
