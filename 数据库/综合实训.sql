--1.����һ������Ϊstu_1�����ݿ�
create database  stu_1
--2.����һ������Ϊstu_2�����ݿ�
create database  stu_2
--3.��D�������ݿ�stu_2�����һ����ʼ��СΪ2MB�������ļ����ļ���5%�Զ�����
use master
alter database stu_2
add file
(
name=data_file,
filename='d:\data_file.ndf',
size=2mb,
filegrowth=5%
)
go
/*4.��stu_1���ݿ��´���һ��ѧ����student��xh,xm,csrq��
		�ֶ�		����
		xh	   	����          --ѧ��
		xm		   �ַ���			--����
		csrq      ������			--��������
	Ҫ�󣺰�xh ���ó������� xm������Ϊ�ա�*/
use stu_1
go
create table student
(xh int primary key,
xm varchar(20),
csrq datetime
)
go
/*5. ��stu_1���ݿ��´���һ��ѧ���ɼ���xscj(xh,cj)
�ֶ�		����
		xh	   	����			--ѧ��
		cj		   ������		--�ɼ�
Ҫ�󣺰�xh ���ó�����*/
use stu_1
go
create table xscj
(xh int primary key,
cj float
)
go
--6.��ѧ����student������һ���Ա�xb���кͰ༶��bj����
alter table student add xb char(2)
alter table student add bj varchar(20)
--7.��ѧ����student��ɾ���༶��bj����
alter table student drop column bj
--8.��student�����ĳ�stu_info
exec sp_rename 'student','stu_info'
--9.��stu_info���е�����xm�޸ĳ�username
exec sp_rename 'stu_info.xm','username'
--10.���stu_info������������
insert into stu_info(xh,username,csrq,xb) values('1001','����','1998-5-20','Ů')
insert into stu_info(xh,username,csrq) values('1002','����','1998-5-20')
insert into stu_info(xh,username,csrq) values('1003','����','1999-5-20')
select * from stu_info
--11.���xscj������������
insert into xscj values('1001',89)
insert into xscj values('1002',89)
insert into xscj values('1003',89)
insert into xscj values('1004',89)
--12.�ѱ�stu_info������Ϊ����������ѧ�����Ա�ĳɡ��С�
update stu_info set xb='��' where username='����'
update stu_info set xb='Ů' where username='����'
--13.��ѯstu_info�����������ŵ�ѧ����Ϣ
select * from stu_info where username like '��%'
--14.��ѯstu_info��ʱ���˱����ظ����ݡ�
select distinct username from stu_info
select username from stu_info where username='����'
select distinct username from stu_info where username='����'
--15.��ѯstu_infoǰ2������
select top 2 * from stu_info
--16.��ѯstu_info��ֻ��ʾusername������Ϊ��������xb������Ϊ�Ա������ֶ�
select username as ����,xb as �Ա� from stu_info
--17.��ѯstu_info����ѧ����xscj���еĳɼ�
select stu_info.xh as ѧ��,username as ����,cj as �ɼ� from stu_info
join xscj
on stu_info.xh=xscj.xh
--18.�ڱ�stu_info��ɾ������Ů����Ϣ
delete from stu_info where xb='Ů'
--19.��ȡ���е����ݿ���
select name from master.dbo. sysdatabases
--20.��ȡ���еı���
select name from sysobjects  --��ѯ���еı�
select name from sysobjects where xtype='u' --��ѯ�û���
select name from sysobjects where xtype='s' --��ѯϵͳ��
--21.ɾ����
Drop table stu_info
--22.ɾ�����ݿ�stu_2
DROP DATABASE stu_2
