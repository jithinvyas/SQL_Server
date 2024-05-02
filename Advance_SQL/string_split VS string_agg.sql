select * from tblEmployee

-- ID	Name		Gender	Salary
-- 1	Sara Nani	Female	4500
-- 2	James Histo	Male	5300
-- 3	Mary Jane	Female	6200
-- 4	Paul Sensit	Male	4200
-- 5	Mike Jen	Male	5500


select 
	Gender, 
	string_agg(Name,', ') as Namelst 
from tblEmployee
group by Gender;

-- Gender	 Namelst
-- Female	 Sara Nani, Mary Jane
-- Male	Paul Sensit, Mike Jen, James Histo


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
cross apply string_split(Namelst,',') 
order by Names

-- gender	Names
-- Male	    James Histo
-- Female	Mary Jane
-- Male	    Mike Jen
-- Male	    Paul Sensit
-- Female	Sara Nani