use sampledb
sp_help
select * from students
---------------------------------------
--FUN1
create function empFun1 (@stid int)
returns table as 
return 
	(select * from students 
	where [stu.id]=@stid)
	
--EXECUTE-1
select * from dbo.empFun1 (105)
----------------------------------------
----------------------------------------
----------------------------------------
select * from students

--FUN2
create function empFun2 (@stid int)
returns varchar(30) as
begin
declare @ename as varchar(30)
	if (SELECT COUNT(*) FROM students WHERE [stu.id] = @stid) <> 0
	BEGIN
		select @ename = [st.Name] from students
		where [stu.id]=@stid;
	END
	else
	set @ename='invalid id'
return @ename
end

--EXECUTE-2
select dbo.empFun2 (561) as someName
drop function empFun2
----------------------------------------
----------------------------------------
----------------------------------------
select * from students

--FUN3
create function mul_Age_GPA (@stid int)
returns FLOAT as
begin
	declare @result FLOAT
	select @result =  (Age * GPA) from Students
	where [stu.Id] = @stid

	return @result
end

--EXECUTE-3
declare @a int = 101;
while @a<=105
begin
select *,dbo.mul_Age_GPA(@a) as result from students where [stu.id]=@a 
set @a=@a+1
--select *,dbo.mul_Age_GPA(@a) as result from students where [stu.id]=@a 
end

-------------------------------------------------
select *, (age*gpa) as result from students;
-------------------------------------------------