/*--------------�򵥲�ѯ--------------*/
/*�������ݿ�*/
create database student
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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10001','����','��','����1','����',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10002','����','��','����1','����',92.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10003','����','Ů','���1','���',78.5)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','����','Ů','����2','����',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','��','����3','����',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','Ů','����4','����',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','Ů','���1','���',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','Ů','���1','���',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','Ů','���2','���',null)
go
select * from xscj
go
/*���������α�*/
declare my_cursor cursor scroll
for 
select * from xscj
go
--���α�
open my_cursor
--��ȡ����
fetch next from my_cursor
fetch last from my_cursor
fetch prior from my_cursor
fetch next from my_cursor
fetch first from my_cursor
fetch absolute 5 from my_cursor
fetch relative -5 from my_cursor
--�޸ĵ�ǰ�α�ָ���е�����
update xscj set cj=100 where current of my_cursor
update xscj set cj=10 where current of my_cursor
--ɾ����ǰ�α�ָ��������
delete xscj  where current of my_cursor
--�ر��α�
close my_cursor
--�ͷ��α�
deallocate my_cursor
