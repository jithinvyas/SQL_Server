--Arithmetic operations
declare @a as int, @b int
set @a=7 set @b=5
print ceiling (@a*@b) 
-----------------------
--string Operations
declare @name varchar(20), @country varchar(20)
set @name = 'Jithin' set @country = 'India'
print @name + ' ' + @country
-----------------------------

-- string and Numeric Mix
declare @str varchar(20), @num int
set @str='Vyas' set @num=77
print cast(@num as varchar(10)) +' ' + @str

-- set vs select
declare @day int, @mon int, @yr int
select @day = datepart(dd, getdate())
set @mon = datepart(mm, getdate())
set @yr = datepart(yy, getdate())
print cast(@day as varchar(12))  + '-' + 
		cast(@mon as varchar(12)) + '-' + 
		cast(@yr as varchar(12));

-- Getting Long Spaces in date
declare @day int, @mon int, @yr int
set @day = datepart(dd, getdate())
set @mon = datepart(mm, getdate())
set @yr = datepart(yy, getdate())
print str(@day)  + '-' + 
		str(@mon) + '-' + 
		str(@yr)

-- Remove Spaces
declare @val varchar(30)
set @val = 'SQL Server practise session'
select @val res1
--select @val

--print replace(@val, ' ', '')
select replace(@val, ' ', '') as res2  --spaces removed


-- T-SQL to display total days completed
declare @no_days int
select @no_days = DATEDIFF(dd,'2022/08/18', getdate())
print 'The number of days = ' + cast(@no_days as varchar)


-- substring(string, init val, lenth_of_str)

select substring('jithinvyas@sql.com',0, charindex('@','jithinvyas@google.com'))
select substring(right('jithinvyas@sql.com',7),0,11)

select charindex('@','jithin.vyas@wipro.com') --> since '@' is at 12th posotion
select (right('jithinvyas@sql.in',7))         --> 7 letters from right are masked