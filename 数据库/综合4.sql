create database student
go
use student
go
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
go
create table s1
(
xh varchar(20),
xm varchar(20)
)
go
create table s2
(
xh varchar(20),
xm varchar(20),
cj float
)
go
--1. ��xscj��Ϊ��������һ����Ϊview_cj����ͼ��ʵ�ֲ�ѯ�ɼ����ڵ���80�ֵ�ѧ����Ϣ��
create view view_cj
as
select * from xscj where cj>=80
go
--��ѯ��ͼ
select * from view_cj
--2.�޸�view_cj��ͼ��ʵ�ֲ�ѯ����Ů���ҳɼ����ڵ���60�ֵ�ѧ����Ϣ
alter view view_cj
as
select * from xscj where xb='Ů' and cj>=60
go
--��ѯ��ͼ
select * from view_cj
--3. ʹ��ϵͳ�洢���̲鿴��ͼView_cj����Ϣ
exec sp_helptext view_cj
go
--4. ��xh�ֶν��򴴽��ۼ���������������index_xscj��
create clustered index index_xscj
on xscj(xh desc)
go
--5. �鿴����index_xscj ����Ϣ
exec sp_helpindex index_xscj
go
--6.�������������Ĵ洢����(p)��ʵ�ֲ�ѯxscj������������Ϣ
create proc p
as
select * from xscj where xb='��'
go
--ִ��p
exec p
--7.�����������Ĵ洢����(p1)�����Ա��ѯxscj���е���Ϣ
create proc p1
@sex varchar(2)
as
select * from xscj where xb=@sex
go
--ִ��p1
exec p1 'Ů'
exec p1 '��'
--8.����p�Ĵ�����
exec p
--9.����p1�洢����
exec p1 '��'
--10.�޸Ĵ洢���̣����洢����p�Ĺ����޸ĳɲ�ѯ���ڵ��ڸ���������ѧ����Ϣ
alter proc p
@cj float
as
select * from xscj where cj>=@cj
go
--����p
exec p 80
--11. insert��������ΪS1������ΪmyInserte ��insert��������ʵ�����s1��������ʱ�������������s2��������
create trigger myinserte
on s1
for insert
as
declare @xh varchar(10)
declare @xm varchar(10)
select @xh=xh from inserted
select @xm=xm from inserted
insert into s2 values(@xh,@xm,0)
go
--��������ǰ��ѯ
select * from s1
select * from s2
--��s2���������
insert into s1(xh,xm) values('1001','����')
insert into s1(xh,xm) values('1002','����')
--�������ݺ��ѯ
select * from s1
select * from s2
--12. update��������ΪS1����һ����ΪmyUpdate��update�����������Ըñ�ġ�xm�����޸�ʱ�����ô�������ʹ�û������޸ġ�xm���С�
create trigger myUpdate
on s1
for update
as
if update(xm)
	begin
		rollback transaction --�����޸Ĳ���
		print '�������޸�����'
	end
go
--�޸�ѧ������
update s1 set xm='����' where xh='1001' --�����ڴ���������������������ֹ
update s1 set xh='1003' where xh='1001' --�޸ĳɹ�
select * from s1
--13. delete��������ΪS1����һ����ΪmyDelete��delete��������ʵ�ֶԱ�s1ɾ������ʱ����������ͬʱɾ����s2�ж�Ӧ������
create trigger myDelete
on s1
for delete
as
declare @xh varchar(10)
select @xh=xh from deleted
delete s2 where xh=@xh
go
--ɾ��ѧ��Ϊ1002��ѧ����Ϣ
select * from s1
select * from s2
delete s1 where xh='1002'
--14. �鿴S1���еĴ�������Ϣ
exec sp_helptrigger s1
--15. ɾ��mydelete������
drop trigger mydelete
--16. ������¼��aa������Ϊ123��Ĭ�����ݿ�Ϊstudent���������ݿ��û���bb��ӳ�䵽aa��¼���������ݿ��û���bb�����ѯ�͸��±�xscj���Ȩ��
--������¼��aa
create login aa
with password='123',
default_database=student
go
--�����û���bb,��ӳ�䵽��¼��aa��
create user bb for login aa
go
--�����ݿ��û������ѯ�͸��±�xscj���Ȩ��
grant select,update on xscj  to bb
go