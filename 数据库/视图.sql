/*1.�������ݿ�*/
create database student
on primary
(
name=student,
filename='d:\data\student.mdf',
size=200mb,
maxsize=500mb,
filegrowth=10%
)
log on
(
name=student_log,
filename='d:\data\student.ldf',
size=5mb,
maxsize=100mb,
filegrowth=10%
)
go
/*1.�������ݱ�stu_xscj*/
create table st
(sno char(5),
cno char(5),
score numeric(3,0)
)
go
/*2.�����ݿ�*/
use student
go
/*2.��������*/
insert into st(sno, cno, score)
values(10001,'01',95)
insert into st(sno, cno, score)
values(10002,'02',95)


/*��1��ʹ��T-SQL������ͼ��ѧ��������ͼ����ͼ��ΪView_st*/
create view view_st
as
select * from st
go
select * from st
select * from view_st
go
/*��2��ʹ��T-SQL�޸���ͼView_st��Ҫ��ɼ�����90��*/
alter  view  view_st
as
select * from st where score>90
go

/*2.��������*/
insert into view_st(sno, cno, score)
values(10003,'03',91)
insert into view_st(sno, cno, score)
values(10003,'03',81)
go
select * from st
select * from view_st
go
/*��4��ʹ��T-SQL�޸���ͼView_st�е����ݣ�Ҫ���ѧ��Ϊ1002��ѧ���ɼ��޸�Ϊ100��*/
update view_st set score=100 where sno='1002'
update view_st set score=100 where sno='1001'
/*��ѧ��Ϊ1002��ѧ����Ϣɾ����*/
delete view_st where sno='1002'
/*��5��ʹ��ϵͳ�洢���̲鿴��ͼView_st��Ϣ*/
exec sp_help   view_st
exec sp_helptext   view_st
/*��6��ʹ��ϵͳ�洢�����޸���ͼ����Ҫ���View_st��ΪView_test*/
sp_rename  view_st,view_test
/*ɾ����ͼ*/
drop view view_st