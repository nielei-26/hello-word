create database student
use student
create table zy
(zyid int primary key,
zyname varchar(20) not null
)
/*��������*/
insert into zy(zyid,zyname) values(1001,'����')
insert into zy(zyid,zyname) values(1002,'���')
insert into zy(zyid,zyname) values(1003,'�Ź�')
insert into zy(zyid,zyname) values(1004,'������')
insert into zy(zyid,zyname) values(1005,'������')
go
select * from zy
/*��ʾ�ύ����*/
set xact_abort on
begin transaction
insert into zy(zyid,zyname) values(1006,'����')
insert into zy(zyid,zyname) values(1007,'����')
insert into zy(zyid,zyname) values(1006,'����')
commit
go
select * from zy
go
insert into zy(zyid,zyname) values(1006,'����')
insert into zy(zyid,zyname) values(1007,'����')
insert into zy(zyid,zyname) values(1006,'����')
go
/*�鿴��ǰ��*/
execute sp_lock