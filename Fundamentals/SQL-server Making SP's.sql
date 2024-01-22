SELECT * FROM SYS.TABLES

select * from emp
insert into emp values (101,'RAMA',4123),(1411,'RAMA',null),(9631,'kRISHNA',3423)
begin tran
delete from emp
rollback

select * from emp

--Deleting Duplicate values using Row_Number()
create or alter procedure sp_duplicates (@col_name varchar(10)) as
begin
select empno,ename,sal from
(select *,ROW_NUMBER() over(partition by @col_name order by(select 0)) as rn from emp ) x
where x.rn=1
end
--execute 1
exec sp_duplicates ename

------------------------------------------------------------------------
--**********************************************************************
create or alter procedure sp_dups (@col_name varchar(10)) as
begin
declare @query nvarchar(max)
set @query = N'
select empno,ename,sal from
(select *,ROW_NUMBER() over(partition by' + 
						QUOTENAME( @col_name ) + 
						'order by(select 0)) as rn from emp ) x
where x.rn=1'
exec sp_executesql @query
end

exec sp_dups ename

--Factorial of number from the table
create or alter function fn_factorial (@nums int) returns int as 
begin
declare @result int
if @nums = 0
	set @result = 1
else
	set @result = @nums * dbo.fn_factorial(@nums-1)
return @result
end

select dbo.fn_factorial (5)
-----------------------------------------------------------------------
--*********************************************************************
create table test (number int identity, factorial int)

declare @num int = 0
while @num<7
begin
set @num = @num + 1
insert into  test(factorial) values(dbo.fn_factorial(@num))  ----------------------------xxxxxxxxxxxxxxxx----------------------
end

select * from test
truncate table test
-------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

--Attach the while loop records to one table
DECLARE @ResultTable TABLE (
    CounterValue INT
)
DECLARE @Counter INT = 1

WHILE @Counter <= 10
BEGIN
    INSERT INTO @ResultTable (CounterValue)        ----------------------------xxxxxxxxxxxxxxxx----------------------
    dbo.fn_factorial(@counter)

    SET @Counter = @Counter + 1
END

-- Select all records from the table variable
SELECT * FROM @ResultTable
--------------------------------------------------------------------------------------
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

--Dynamic SQL querry
declare @sql nvarchar(max)
set @sql = 'select * from emp'
exec (@sql)
-------------------------------------------------------------------
create or alter procedure sp_dynamic_sql (@querry nvarchar(max)) as
begin
declare @sql nvarchar(max)
set @sql = @querry
exec (@sql)
end

sp_dynamic_sql 'select * from emp'
----------------------------------------------
----------------------------------------------
select * from sys.objects where type_desc = 'sql_stored_procedure'