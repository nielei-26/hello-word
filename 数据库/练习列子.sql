/*����һ����ʱ��*/
create table #temp
(
���� varchar(50) not null,
�γ� varchar(50) null,
���� int null
)
go
insert into #temp
select 'С��','C#',90 UNION
select 'С��','spl',93 UNION
select 'С��','C#',82 UNION
select 'С��','sql',88 UNION
select 'С��','C#',null
go
select * from #temp
select ����,�γ�, sum(����) from #temp
group by �γ�, ����
with cube