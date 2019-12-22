/*创建一个临时表*/
create table #temp
(
姓名 varchar(50) not null,
课程 varchar(50) null,
分数 int null
)
go
insert into #temp
select '小红','C#',90 UNION
select '小红','spl',93 UNION
select '小明','C#',82 UNION
select '小明','sql',88 UNION
select '小李','C#',null
go
select * from #temp
select 姓名,课程, sum(分数) from #temp
group by 课程, 姓名
with cube