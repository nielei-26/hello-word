/*1.�������ݿ�*/
create database student
on primary
(
name=student,
filename='d:\data\student.mdf',
size=100mb,
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
/*.�����ݿ�*/
use student
go
/*2.��������ļ�*/
use master
go
alter database student
add file
(
name=student_data,
filename='d:\data\student_data.ndf',
size=5mb,
filegrowth=10%
)
go
/*3.���������־�ļ�*/
use master
go
alter database student
add log file
(
name=student1_log,
filename='d:\data\student1_log.ldf',
size=5mb,
filegrowth=10%
),
(
name=student2_log,
filename='d:\data\student2_log.ldf',
size=5mb,
filegrowth=10%
)
go
--4.��student�������ļ���ʼ��С�޸ĳ�400MB
alter database student
modify file
(
name=student,
size=400mb
)
go
--5.��student��������student_info
EXEC sp_renamedb 'student','student_info'
go
--6.�������ݱ�xscj(xh,xm,bj,cj)
create table xscj
(xh int primary key not null,
xm varchar(10) not null,
bj varchar(20) not null,
cj numeric(5,1)
)
go
--7.��ѯxscj����cj�ֶν�������,�ٰ�xh��������
select*from xscj order by cj desc, xh asc
--8.���༶�ֱ�ͳ��xscj���е�ƽ���֡���߷ֺ���ͷ֡�
select bj as �༶,avg(cj) as ƽ���ɼ�, Max(cj) AS ��߷�,Min(cj) AS ��ͷ� from xscj group by bj
--9.ɾ��xscj�������з�����רҵ��ѧ����Ϣ
DELETE from xscj where zy  not in('����')
--10.���xscj���е�����
DELETE from xscj
--11.ɾ��xscj��
drop table xscj
