--Fetch the current date and time
select getdate();
select getdate()+1;
select getdate()-1;

--Is it in date format or not
select ISDATE('2023-07-15 15:10:37.410');
select ISDATE('2023-07-15');
select ISDATE('15:10:37.410');
select ISDATE('15-10-2000');

--two in one's
select DATEPART(year,getdate())
select year(getdate())

select format(getdate(), 'MM')
select month(getdate())

SELECT 
GETDATE() AS SYSTEMDATE,
FORMAT(GETDATE(),'M'),   --> January 22
FORMAT(GETDATE(),'MM'),  --> 01
FORMAT(GETDATE(),'MMM'), --> Jan

FORMAT(GETDATE(),'D'),    --> Monday, January 22, 2024
FORMAT(GETDATE(),'Y'),    --> January 2024
FORMAT(GETDATE(),'YY')    --> YY

select datepart(millisecond,getdate()) as milliSeconds

/*Date part is used to get the part of the supplied datetime value*/
select DATEPART(year, getdate()) yr
select DATEPART(month, getdate()) mm
select DATEPART(day, getdate()) dd

select DATEPART(hour, getdate()) hrs
select DATEPART(minute, getdate()) min
select DATEPART(second, getdate()) sec
select datepart(millisecond, getdate()) ms

--DATEADD
--A fuction adds a number to specified date part of input date
SELECT DATEADD(DAY, -10, '2020/06/10') AS DAY_INC;
SELECT DATEADD(month, 6, '2019.06/10') AS MONTH_INC;
SELECT DATEADD(YEAR, 5, '2018-06-10') AS YEAR_INC;

--DATEDIFF
-- difference between two date values
SELECT DATEDIFF(y, '2020/01/01', '2020/12/31') AS DateDiff; --day, dy, y = Day
SELECT DATEDIFF(ww, '2023/07/11', '2023/07/25') AS DateDiff; --week, ww, wk = Week
SELECT DATEDIFF(mm, '2018/10/05', '2018/12/25') AS DateDiff; --month, mm, m = month
SELECT DATEDIFF(dayofyear, '2018/10/05', '2018/10/05') AS DateDiff;


SELECT DATEDIFF(hour, '2017/08/25 05:00', '2017/08/25 11:45') AS DateDiff;
SELECT DATEDIFF(minute, '2017/08/25 05:10', '2017/08/25 05:45') AS DateDiff;
SELECT DATEDIFF(second, '2017/08/25 05:10:25', '2017/08/25 05:11:35') AS DateDiff;
SELECT DATEDIFF(ms, '2017/08/25 05:10:25:100', '2017/08/25 05:10:26:200') AS DateDiff;

