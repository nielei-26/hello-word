create database student
go
use student
go
--������
create table st
(xh varchar(20),
xm varchar(20))
go
insert into st values('1001','����')
--��ȨCRACT�����ݿ��û�aa����½��bb��
--��st��Ĳ�ѯ�Ͳ���Ȩ������aa�û�
create login bb --������¼��
with password='123',
default_database=student
go
create user aa for login bb --�������ݿ��û�aa
go
--���û�aa����st��ѯ�Ͳ���Ȩ��
grant select,insert on st to aa
go
--���
select * from st --�����ɹ�
insert into st values('1002','AA') --�����ɹ�
delete st   --�������ɹ�
update st set xm='BB' where xh='1002' --�������ɹ�
go
--�ܾ�Ȩ��deny
deny insert on st to aa
go
--���
insert into st values('1003','CC') --��������ܾ�
--����Ȩ��revoke
--�ջ�select,insertȨ��
revoke select,insert on st from aa
go
--���
select * from st --�������ɹ�
insert into st values('1002','AA') --�������ɹ�
go


/*�����ܹ�*/
create schema my_schena
authorization aa
go

