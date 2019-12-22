--创建备份文件
exec sp_addumpdevice'disk',
'testfile',
'd:\t1\testfile.bak'
go
create database student
go
--向备份文件中备份数据
backup database student
to testfile
go
--删除备份文件及同时删除物理文件
exec sp_dropdevice testfile,delfile
go

--完整备份student数据库，备份到D：/databak目录下
backup database student
to disk='d:\databak\student_bak201911.bak'
with format
--还原数据库
restore database student
from disk='d:\databak\student_bak201911.bak'
with replace
--备份日志
backup log student
to disk='d:\databak\student_bak201911.log'
with norecovery  --备份日志尾部
--差异备份  
backup database student
to disk='d:\databak\student_bak201911.bak'
with differential
--1.恢复前先让数据库离线
alter database student set offline with rollback immediate
--2.恢复完后让数据库上线
alter database student set online with rollback immediate