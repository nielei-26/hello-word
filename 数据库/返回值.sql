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
/*����ַ�����ʼ�ո�*/
print ltrim('  abcd  ')
/*����ַ���β�Ŀո�*/
print rtrim('  abcd  ')
/*�ַ����滻*/
print replace('aabbaabb','aa','kk')
/*����߿�ʼȡ3���ַ�*/
print left('abcdefg',3)
/*���ұ߿�ʼȡ5���ַ�*/
print right('abcdefg',5)
/*ȡϵͳ���ڵ�������*/
select getdate() as ��ǰ����,year(getdate()) as ��,
month(getdate()) as ��,day(getdate()) as ��
/*��ָ�������ϼ�2��*/
select dateadd(day,2,'2019-10-9')
/*����ָ�����������ڵ�ʱ����*/
select datediff(day,'2019-10-1','2019-10-9')
/*����ָ�������������ڼ�*/
select datename(weekday,'2019-10-11')
/*����ָ���������ǵ���ڼ���*/
select datename(week,'2019-10-9') as ��
/*����������,ʱ����*/
select datepart(year,getdate()) as ��,
datepart(month,getdate()) as ��,
datepart(day,getdate()) as ��,
datepart(hour,getdate()) as ʱ,
datepart(minute,getdate()) as ��,
datepart(second,getdate()) as ��

