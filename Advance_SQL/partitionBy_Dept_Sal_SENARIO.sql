-- 1. Create the table (drop table Employees)
CREATE TABLE Employees (
    Empid NVARCHAR(10),
    Salary INT,
    Department NVARCHAR(10)
);

-- 2. Insert the data
INSERT INTO Employees (Empid, Salary, Department)
VALUES
    ('E1', 10000, 'D1'),
    ('E1', 10000, 'D1'),
    ('E2', 20000, 'D1'),
    ('E2', 20000, 'D1'),
    ('E2', 20000, 'D1'),
    ('E3', 20000, 'D1'),
    ('E4', 10000, 'D1'),
    ('E5', 30000, 'D1'),
    ('E6', 10000, 'D2'),
    ('E7', 30000, 'D2'),
    ('E8', 40000, 'D2'),
    ('E9', 40000, 'D2');

--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- 3. Query to delete the old emp salaries in each department, fetch only latest records
with cte as
		(select *,
				max(rno) over(partition by Department,salary order by department) as max_rno 
		from
			(select *,
					row_number() over(partition by Department,salary order by department) as rno 
			from Employees)t1
)
delete from cte
where max_rno <> rno

-- 4. Check the final data
select * from Employees