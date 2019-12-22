/*--------------------一、T-SQL创建表时创建数据约束例-----------------------------*/
create database student
use student
go
--1.创建主键约束：建立学生信息表stu_info，定义学号为主键
create table stu_info
(学号 varchar(20) primary key,
名称 varchar(20) not null,
)
go
--例2：创建主键约束：建立一个St表，定义SNO，CNO共同组成SC的主键
create table st
(sno varchar(15) not null,
cno varchar(15) not null,
cj numeric(5,2),
constraint sc_prim primary key(sno,cno)
)
go
--例3：创建惟一性约束：创建一个学生信息表stuent，其中ID为主键,name字段具有惟一性
create table student
(id int, --primary key,
name varchar(20),
sex char(2),
constraint id_prim primary key(id),
constraint uq_name unique(name)
)
insert into student(id,name,sex) values(101,'张三','男')
insert into student(id,name,sex) values(102,'张三','女')
go
--例4：检查约束：建立一个SC表，定义cj的取值范围为0到100之间
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
--例5：默认约束：建立dept表，为deptname字段创建默认约束为“大数据与信息产业学院”
create table dept
(depcno varchar(20),
deptname varchar(50) default '大数据与信息产业学院'
)
insert into dept(depcno) values('1001')
insert into dept(depcno,deptname) values('1001','商学院')
select * from dept
--例6：外键约束:建立一个SS表，定义SNO,CNO为SC的外部键,其中S表的主键是SNO,C表的主键是CNO
--创建s表
create table s
(sno int not null,
primary key(sno),
sname varchar(20)
)
go
--创建c表
create table c
(cno int primary key,
cname varchar(20)
)
go
--创建ss表
create table ss
(sno int not null constraint s_fore foreign key references s(sno),
cno int not null constraint c_fore foreign key references c(cno),
cj int,
constraint sno_cno_prim primary key(sno,cno)
)
go
--例7：删除约束规则、默认和约束
alter table sc
drop constraint cj_chk
go
/*------------------二、T-SQL在已存在的表上创建数据约束---------------------------*/
create table stu_score
(sno int not null,--说明：如果sno没有设置为not null, 则无法定义该字段为主键
name varchar(20),
zf int,
yx varchar(50)
)
go
--例1：在表stu_score中为字段sno增加主键
alter table stu_score
add constraint prk_sno primary key(sno)
go
--例2：在表stu_score中为字段name增加唯一约束
alter table stu_score
add constraint wy unique(name)
go
--例3：在表stu_score中为字段zf增加检查约束
alter table stu_score
add constraint zf_chk check(zf>=0 and zf<=750)
go
insert into stu_score(sno,name,zf,yx) values(1001,'张三',751,'aaa')
insert into stu_score(sno,name,zf,yx) values(1001,'张三',750,'aaa')
go
--例4：在表stu_score中为yx增加默认约束，默认值为“大数据与信息产业学院”
alter table stu_score
add constraint df_yx default '大数据与信息产业学院'
for yx
insert into stu_score(sno,name,zf) values(1002,'AAA',750)
SELECT * FROM stu_score
--例5：在表stu_score中增加外部键约束(参照表为s表，字段为sno)
alter table stu_score
add constraint fore_s foreign key(sno) references s(sno)
--例6：删除约束规则、默认和约束
alter table sc
drop constraint cj_chk
go