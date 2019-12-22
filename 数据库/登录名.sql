create login [F405-15\python]
from windows
with default_database=student
--创建一个sql 登录名
create login sql_tt
with password='123',
default_database=student
go
use student
go
create user data_user for login sql_tt
go
drop login sql_tt
drop user data_user