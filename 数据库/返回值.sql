print abs(-10)
select abs(-10)
print pi()
print round(pi(),2)
print rand()
select floor(rand()*9)+1
select floor(rand()*9)+1
select floor(rand()*10)
print round(rand(),2)
print ascii('abvd')
print len('abvd')
print lower('ABCde')
print upper('ABCde')
/*清除字符串起始空格*/
print ltrim('  abcd  ')
/*清除字符串尾的空格*/
print rtrim('  abcd  ')
/*字符串替换*/
print replace('aabbaabb','aa','kk')
/*从左边开始取3个字符*/
print left('abcdefg',3)
/*从右边开始取5个字符*/
print right('abcdefg',5)
/*取系统日期的年月日*/
select getdate() as 当前日期,year(getdate()) as 年,
month(getdate()) as 月,day(getdate()) as 日
/*在指定日期上加2天*/
select dateadd(day,2,'2019-10-9')
/*返回指定的两个日期的时间间隔*/
select datediff(day,'2019-10-1','2019-10-9')
/*返回指定的日期是星期几*/
select datename(weekday,'2019-10-11')
/*返回指定的日期是当年第几周*/
select datename(week,'2019-10-9') as 周
/*返回年月日,时分秒*/
select datepart(year,getdate()) as 年,
datepart(month,getdate()) as 月,
datepart(day,getdate()) as 日,
datepart(hour,getdate()) as 时,
datepart(minute,getdate()) as 分,
datepart(second,getdate()) as 秒

