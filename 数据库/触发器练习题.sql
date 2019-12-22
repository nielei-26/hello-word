/*------------------��������ϰ�����------------------*/
create database student
go
use student
go
--��1. ������s1��s2������s1(xh,xm)��s2(xh,xm,cj)
create table s1
(xh varchar(20),
xm varchar(20))
go
create table s2
(xh varchar(20),
xm varchar(20),
cj float)
go
--��2. insert��������ΪS1������ΪmyInserte ��insert��������ʵ�����s1��������ʱ�������������s2��������
create trigger myInserte
on s1
for insert
as
declare @xh varchar(20)
declare @xm varchar(20)
select @xh=xh from inserted
select @xm=xm from inserted
insert into s2 values(@xh,@xm,0)
go
--��ѯs1��s2����ʾΪ�ձ�select * from s1select * from s2go--���s1�в�������
insert into s1 values('1001','����')
insert into s1 values('1002','����')
go
--��ѯs2��s2����ʾ�ղ��������*/
select * from s1
select * from s2
--��3. update��������ΪS1����һ����ΪmyUpdate��update�����������Ըñ�ġ�xm�����޸�ʱ�����ô�������ʹ�û������޸ġ�xm���С�
create trigger myUpdate
on s1
for update
as
if update(xm)
	begin 
		rollback transaction
		print'�����޸�������Ϣ'  
	end
go    
 --�����޸Ĳ���print '�����޸�ѧ��������Ϣ'endgo --�޸�xm��Ϣ������myUpdate������
 update s1 set xm='����' where xm='����'
 go
 --��4. delete��������ΪS1����һ����ΪmyDelete��delete��������ʵ�ֶԱ�s1ɾ������ʱ����������ͬʱɾ����s2�ж�Ӧ������
create trigger myDelete
on s1
for delete
as
declare @xh varchar(20)
select @xh=xh from deleted
delete s2 where xh=@xh
/*ɾ����s1�е�����*/
delete s1 where xh='1001'
/*��ѯs2��s2����ʾ��ɾ�������������*/
select * from s1
select * from s2
--��5. �鿴S1���еĴ�������Ϣ
execute sp_helptrigger s1
--��6. ɾ��mydelete������
drop trigger mydelete