--���������ļ�
exec sp_addumpdevice'disk',
'testfile',
'd:\t1\testfile.bak'
go
create database student
go
--�򱸷��ļ��б�������
backup database student
to testfile
go
--ɾ�������ļ���ͬʱɾ�������ļ�
exec sp_dropdevice testfile,delfile
go

--��������student���ݿ⣬���ݵ�D��/databakĿ¼��
backup database student
to disk='d:\databak\student_bak201911.bak'
with format
--��ԭ���ݿ�
restore database student
from disk='d:\databak\student_bak201911.bak'
with replace
--������־
backup log student
to disk='d:\databak\student_bak201911.log'
with norecovery  --������־β��
--���챸��  
backup database student
to disk='d:\databak\student_bak201911.bak'
with differential
--1.�ָ�ǰ�������ݿ�����
alter database student set offline with rollback immediate
--2.�ָ���������ݿ�����
alter database student set online with rollback immediate