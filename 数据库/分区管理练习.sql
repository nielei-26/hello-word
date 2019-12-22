/*����������ϰ*/
--1������student���ݿ�
create database student
go
--2����student���ݿ�--
use student
go
--3.����ļ���
--�﷨��alter database ���ݿ��� add  filegroup �ļ�����
--��student���ݿ�������ļ���fg1,fg2,  fg3,fg4
alter database student add filegroup fg1
alter database student add filegroup fg2
alter database student add filegroup fg3
alter database student add filegroup fg4
--4.���ļ�������������ļ�
--�﷨��alter adtabase ���ݿ��� add file  ���ݱ�ʶ to filegroup �ļ���
--���ֱ����ļ�������������ļ�data_file1��data_file2��data_file3��data_file4
alter database student
add file
(name=data_file1,
filename='d:\data_file1.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg1
go
alter database student
add file
(name=data_file2,
filename='d:\data_file2.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg2
go
alter database student
add file
(name=data_file3,
filename='d:\data_file3.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg3
go
alter database student
add file
(name=data_file4,
filename='d:\data_file4.ndf',
size=2mb,
filegrowth=5%
)
to filegroup fg4
go
--5��������������
use student
go
create partition function myPF(datetime)
as range right
for values('1997-1-1','1998-1-1','1999-1-1')
go
--6������������
create partition scheme myPS
as partition myPF
to(fg1,fg2,fg3,fg4)
go
--7������������
create table stu_info
(
xh int identity(1,1),
xm varchar(20),
csrq datetime,
bj varchar(20)
)
on myps(csrq)
go
insert into stu_info(xm,csrq,bj) values('����','1996-5-23','����1')
insert into stu_info(xm,csrq,bj) values('����','1996-4-15','����2')
insert into stu_info(xm,csrq,bj) values('����','1996-2-3','����3')
insert into stu_info(xm,csrq,bj) values('����','1996-7-12','����4')
insert into stu_info(xm,csrq,bj) values('����','19965-23','����1')
go
select * from stu_info
--8���鿴���еķ����߽�
select * from sys.partition_range_values
--9����ѯ��������
select $partition.myPF('1996-1-1') as �������
select $partition.myPF('1997-1-1') as �������
select $partition.myPF('1998-1-1') as �������
select $partition.myPF('1999-1-1') as �������
--10����ѯ�����е�����
select * from stu_info where $partition.mypf(csrq)=1
select * from stu_info where $partition.mypf(csrq)=2
select * from stu_info where $partition.mypf(csrq)=3
select * from stu_info where $partition.mypf(csrq)=4
--11���ϲ���ɾ��������ģ��
alter partition function
myPF()
merge range('1998-1-1')
go


