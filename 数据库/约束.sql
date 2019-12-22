/*--------------------һ��T-SQL������ʱ��������Լ����-----------------------------*/
create database student
use student
go
--1.��������Լ��������ѧ����Ϣ��stu_info������ѧ��Ϊ����
create table stu_info
(ѧ�� varchar(20) primary key,
���� varchar(20) not null,
)
go
--��2����������Լ��������һ��St������SNO��CNO��ͬ���SC������
create table st
(sno varchar(15) not null,
cno varchar(15) not null,
cj numeric(5,2),
constraint sc_prim primary key(sno,cno)
)
go
--��3������Ωһ��Լ��������һ��ѧ����Ϣ��stuent������IDΪ����,name�ֶξ���Ωһ��
create table student
(id int, --primary key,
name varchar(20),
sex char(2),
constraint id_prim primary key(id),
constraint uq_name unique(name)
)
insert into student(id,name,sex) values(101,'����','��')
insert into student(id,name,sex) values(102,'����','Ů')
go
--��4�����Լ��������һ��SC������cj��ȡֵ��ΧΪ0��100֮��
create table sc
(sno char(10),
cno char(10),
cj int,
constraint cj_chk check(cj>=0 and cj<=100)
)
select * from sc
insert into sc(sno,cno,cj) values('1001','001',100)
insert into sc(sno,cno,cj) values('1002','001',0)
insert into sc(sno,cno,cj) values('1003','001',-1)
go
--��5��Ĭ��Լ��������dept��Ϊdeptname�ֶδ���Ĭ��Լ��Ϊ������������Ϣ��ҵѧԺ��
create table dept
(depcno varchar(20),
deptname varchar(50) default '����������Ϣ��ҵѧԺ'
)
insert into dept(depcno) values('1001')
insert into dept(depcno,deptname) values('1001','��ѧԺ')
select * from dept
--��6�����Լ��:����һ��SS������SNO,CNOΪSC���ⲿ��,����S���������SNO,C���������CNO
--����s��
create table s
(sno int not null,
primary key(sno),
sname varchar(20)
)
go
--����c��
create table c
(cno int primary key,
cname varchar(20)
)
go
--����ss��
create table ss
(sno int not null constraint s_fore foreign key references s(sno),
cno int not null constraint c_fore foreign key references c(cno),
cj int,
constraint sno_cno_prim primary key(sno,cno)
)
go
--��7��ɾ��Լ������Ĭ�Ϻ�Լ��
alter table sc
drop constraint cj_chk
go
/*------------------����T-SQL���Ѵ��ڵı��ϴ�������Լ��---------------------------*/
create table stu_score
(sno int not null,--˵�������snoû������Ϊnot null, ���޷�������ֶ�Ϊ����
name varchar(20),
zf int,
yx varchar(50)
)
go
--��1���ڱ�stu_score��Ϊ�ֶ�sno��������
alter table stu_score
add constraint prk_sno primary key(sno)
go
--��2���ڱ�stu_score��Ϊ�ֶ�name����ΨһԼ��
alter table stu_score
add constraint wy unique(name)
go
--��3���ڱ�stu_score��Ϊ�ֶ�zf���Ӽ��Լ��
alter table stu_score
add constraint zf_chk check(zf>=0 and zf<=750)
go
insert into stu_score(sno,name,zf,yx) values(1001,'����',751,'aaa')
insert into stu_score(sno,name,zf,yx) values(1001,'����',750,'aaa')
go
--��4���ڱ�stu_score��Ϊyx����Ĭ��Լ����Ĭ��ֵΪ������������Ϣ��ҵѧԺ��
alter table stu_score
add constraint df_yx default '����������Ϣ��ҵѧԺ'
for yx
insert into stu_score(sno,name,zf) values(1002,'AAA',750)
SELECT * FROM stu_score
--��5���ڱ�stu_score�������ⲿ��Լ��(���ձ�Ϊs���ֶ�Ϊsno)
alter table stu_score
add constraint fore_s foreign key(sno) references s(sno)
--��6��ɾ��Լ������Ĭ�Ϻ�Լ��
alter table sc
drop constraint cj_chk
go