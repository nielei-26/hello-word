create table zy
(
zyid INT PRIMARY KEY NOT NULL,
zyname varchar(50) not null
)
insert into zy(zyid,zyname)
values(1001,'����')
insert into zy(zyid,zyname)
values(1002,'���')
insert into zy(zyid,zyname)
values(1003,'�Ź�')
insert into zy(zyid,zyname)
values(1004,'������')
insert into zy(zyid,zyname)
values(1005,'������')
/*��xscj���в�ѯ����רҵѧ����Ϣ*/
select * from xscj where zy in(select zyname from zy )
/*��xscj���в�ѯ�ɼ�С��ƽ���ɼ�����Ϣ*/
select * from xscj where (select avg(cj) from xscj)>cj or cj is null
/*1.��xscj���в�ѯ�ɼ�С���������רҵѧ������Ϣ*/
select * from xscj
where cj<
all(select cj from xscj where zy='���') or cj is null
/*��xscj���в�ѯ�ɼ������������רҵѧ������Ϣ*/
select * from xscj
where cj<
any(select cj from xscj where zy='���')
/*exists��������Ӳ�ѯ
1.��xscj���в�ѯ,������רҵ��������ʾȫ����Ϣ*/
select * from xscj
where exists (select * from xscj where zy='����')
/*2.��xscj���в�ѯ,������רҵ����������ʾȫ����Ϣ*/
select * from xscj
where not exists (select * from xscj where zy='����')