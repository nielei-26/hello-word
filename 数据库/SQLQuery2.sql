create table xsxx
(
	xh varchar(10) primary key,
	xm varchar(8) not null,
)

insert into xsxx(xh,xm) values('1001','����')
insert into xsxx(xh,xm) values('1002','����')
insert into xsxx(xh,xm) values('1003','����')
insert into xsxx(xh,xm) values('1004','����')

create table cj
(
	xh varchar(10) primary key,
    cj NUMERIC(5,1)
)

insert into cj(xh,cj) values('1001',86)
insert into cj(xh,cj) values('1002',96)
insert into cj(xh,cj) values('1005',90)
/*������*/
select xsxx .xh as ѧ��,xsxx.xm as ����,cj.cj as �ɼ� from xsxx
join cj on xsxx.xh=cj.xh
/*��������*/
select xsxx .xh as ѧ��,xsxx.xm as ����,cj.cj as �ɼ� from xsxx
left join cj on xsxx.xh=cj.xh
/*��������*/
select xsxx .xh as ѧ��,xsxx.xm as ����,cj.cj as �ɼ� from xsxx
 right join cj on xsxx.xh=cj.xh
 /*ȫ����*/
select xsxx .xh as ѧ��,xsxx.xm as ����,cj.cj as �ɼ� from xsxx
full join cj on xsxx.xh=cj.xh