*--------------�򵥲�ѯ--------------*/
/*�������ݿ�*/
create database student
go
/*�����ݿ�*/
use student
go
/*�������ݱ�*/
create table stu_xscj 
(
	xh int primary key,
	xm varchar(8) not null,
	xb char(2) not null,
	bj varchar(10) not null,
	zY varchar(15) not null,
    cj NUMERIC(5,1)
)
go
/*���뵥������*/
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10001','����','��','����2','����',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10002','����','��','����2','����',92.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10003','����','��','����3','����',93.5)
insert into stu_xscj(xh,xm,xb,bj,zy,cj) values('10004','����','��','����4','����',94)
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
insert into xscj(xh,xm,xb,bj,zy,cj) values('10004','����','Ů','����2','����',94)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10005','A1','��','����3','����',91)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10006','A2','Ů','����4','����',90)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10007','A3','Ů','���1','���',82)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10008','A4','Ů','���1','���',58)
insert into xscj(xh,xm,xb,bj,zy,cj) values('10009','A5','Ů','���2','���',null)
go

select xh,xm,cj
	from xscj
	order by xh
		offset 2 rows
	fetch next 5 rows only
