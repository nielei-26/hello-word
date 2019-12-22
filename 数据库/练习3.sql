/*-------------�������ݿ�-----------------*/
CREATE  DATABASE  student
 

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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','����','Ů','����2','����',100)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','��','����3','����',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','Ů','����4','����',63)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','Ů','���1','���',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','Ů','���1','���',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','Ů','���2','���',81)

/*����cj��*/
create table cj
(cno varchar(10),
cj NUMERIC(5,1)
)

insert into cj(cno,cj) values('10001',89)
insert into cj(cno,cj) values('10001',98)
insert into cj(cno,cj) values('10002',68)
insert into cj(cno,cj) values('10002',84)

--1.����һ���ֲ�����@yx������set����������ֵΪ������������Ϣ��ҵѧԺ��,�����������ֵ��
declare @yx varchar(20)
set @yx='����������Ϣ��ҵѧԺ'
print @yx
--����
select @yx

--2. ����һ���ֲ�����@xm������select��䣬�ѱ���ѧ��Ϊ1001��ѧ���������������������������ֵ��
declare @xm varchar(20)
select @xm=xm from xscj where xh='10001'
print @xm
go

--3. ��ѯxscj����xb�ֶεĳ���
select COL_LENGTH('xscj','xm') as �Ա��ֶγ���

--4.��ȡxscj����xm�ֶ�����ߵ�1���ַ�
select left(xm,1) as ��ȡ������һ���ַ� from xscj
--��ȡxscj����xm�ֶ����ұߵ�1���ַ�
select right(xm,1) as ��ȡ������һ���ַ� from xscj

--5. ��ȡ��ǰϵͳ���ڣ����ֱ�ȡ��������
select getdate() as ��ǰ����,year(getdate()) as ��,month(getdate()) as ��,day(getdate()) as ��

--6.����0��1֮��������
print rand()
--0��1��������ұ�����λС��
print round(rand(),2)

--7.���ء�Hello�����ַ�ASCII����ֵ
print ascii('Hello')

--8. �����ַ�����Hello���ַ�����
print len('Hello')

--9. ���ַ�����Hello��ȫ���ַ�ת����Сд
print lower('Hello')

--10. ���ַ�����Hello��ȫ���ַ�ת���ɴ�д
print upper('Hello')

--11. ���ַ�����Hello���еġ�ll���滻��д�ġ�LL��
print replace('Hello','ll','LL')

--12. ȡ���ַ�����Hello�����������3���ַ���
print left('Hello',3)

--13. ȡ���ַ�����Hello���ұ�������3���ַ���
print right('Hello',3)

--14.��2019��11��25����������ϼ�2��
select dateadd(day,2,'2019-11-25')

--15.����2019��1��1�յ�2019��11��25���������ڵļ��������
print datediff(day,'2019-1-1','2019-11-25')

--16.����2019��5��1��ָ�������������ڼ�
print datename(weekday,'2019-5-1')

--17.����2019��5��1��ָ���������ǵ���ĵڼ���
print datename(week,'2019-5-1')

--18.��д�����ñ���ֵ������
--��1����д����ֵ��������ָ���Ŀγ̺ż���ѧ���ÿγ̳ɼ���ƽ��ֵ��
create function average(@cno varchar(10))
returns float
as
begin
	declare @aver float
	select @aver=(select avg(cj) from cj where cno=@cno)
	return @aver
end
--��2�����ñ���ֵ����
declare @cno varchar(10)
set @cno='10001'
select dbo.average(@cno) as ƽ��ֵ

--19. ��д��������Ƕ��ֵ����
--��1������ͬһ���༶��ѧ���ɼ�
create function xscj_bj(@bj varchar(10))
returns table
as
return(select * from xscj where bj=@bj)
--��2��������Ƕ��ֵ����
select * from dbo.xscj_bj('����3')

--20.���ݱ����е�ֵ������
--�������tq�е�ֵΪ�����硱�������������Ҫ����ɡ��
--�������tq�е�ֵΪ�����ꡱ�����������Ҫ����ɡ��
declare @tq varchar(10)
set @tq='����'  --set @tq='����'
if(@tq='����')
	print '����Ҫ����ɡ'
else
	print '��Ҫ����ɡ'
go

--21.��case��䣬��xscj���У��ѳɼ����ڵ���90�ֵ���Ϊ�š����ڵ���80����С��90�ֵ���Ϊ�������ڵ���70����С��80�ֵ���Ϊ�У����ڵ���60����С��70�ֵ���Ϊ����С��60�ֵ���Ϊ������
--����һ��
select xh,xm,cj,dj=
	case
		when cj>90 then '��'
		when cj>80 and cj<90 then '��'
		when cj>70 and cj<80 then '��'
		when cj>60 and cj<70 then '����'
		else '������'
	end
from xscj
--��������
select xh,xm,cj,dj=
	case floor(cj/10) --�ɼ�����10��ȡ����
		when 10 then '��'
		when 9 then '��'
		when 8 then '��'
		when 7 then '��'
		when 6 then '����'
		else '������'
	end
from xscj
--22.�ֱ����1��100֮���ż��������
declare @i int
set @i=1
print '���1��100֮���ż��'
while(@i<=100)
	begin
		if(@i%2=0)
			begin
		print @i
		set @i=@i+1
			end
		else
			set @i=@i+1
	end
--���1��100֮�������
declare @i int
set @i=1
print '���1��100֮�������'
while(@i<=100)
	begin
		if(@i%2<>0)
			begin
		print @i
		set @i=@i+1
			end
		else
			set @i=@i+1
	end
--23. ����1��50֮�����������ĺ�
declare @i int,@sum int
set @sum=0
set @i=1
while(@i<=50)
	begin
		set @sum=@sum+@i
		set @i=@i+1
	end
	print '����1��50֮�����������ĺ�Ϊ��'
	print @sum