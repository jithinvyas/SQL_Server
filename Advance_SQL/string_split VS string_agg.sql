-- Data
CREATE TABLE Employee (
    ID INT,
    Name NVARCHAR(100),
    Gender NVARCHAR(10),
    Salary INT
);
INSERT INTO Employee (ID, Name, Gender, Salary) VALUES
		(1, 'Sara Nani', 'Female', 4500),
		(2, 'James Histo', 'Male', 5300),
		(3, 'Mary Jane', 'Female', 6200),
		(4, 'Paul Sensit', 'Male', 4200),
		(5, 'Mike Jen', 'Male', 5500);
select * from tblEmployee

-- ID	Name		Gender	Salary
-- 1	Sara Nani	Female	4500
-- 2	James Histo	Male	5300
-- 3	Mary Jane	Female	6200
-- 4	Paul Sensit	Male	4200
-- 5	Mike Jen	Male	5500


-- Collect the Names of all Male & Female Employees
select 
	Gender, 
	string_agg(Name,', ') as Namelst            ---> Grouping
from tblEmployee
group by Gender;

-- Gender	 Namelst
-- Female	 Sara Nani, Mary Jane
-- Male		 Paul Sensit, Mike Jen, James Histo


--Decoding/Reverse the above process
with cte 
as(
	select 
		Gender, 
		string_agg(Name,',') as Namelst
	from tblEmployee
	group by gender
)
select 
	Gender, 
	value as Names 
from cte
cross apply string_split(Namelst,',')            ---> Way of Joining Functions
order by Names

-- Gender	Names
-- Male	    James Histo
-- Female   Mary Jane
-- Male	    Mike Jen
-- Male	    Paul Sensit
-- Female   Sara Nani
