create table teams(teamName varchar(5))
insert into teams values ('SRH'),('CSK'),('MI');
select * from teams;

-- teamName
-- SRH
-- CSK
-- MI



-- Each team should play with every other team only once
--SOLUTION:-1
with cte as(
	select 
		teamName,
		ROW_NUMBER() over(order by teamName) as rn
	from teams
)
select 
	c1.teamName as team1,
	c2.teamName as team2
from cte c1
cross join cte c2
where c1.rn < c2.rn;

--SOLUTION:-2
select t1.teamName as team1, t2.teamName as team2
from teams t1
cross join teams t2
where t1.teamName < t2.teamName                   -- Not Recommended

-- team1   team2
-- CSK	   MI
-- CSK     SRH
-- MI	   SRH




-- Each team should play with every other team twice
--SOLUTION:-1
with cte as(
	select 
		teamName,
		ROW_NUMBER() over(order by teamName) as rn
	from teams
)
select 
	c1.teamName as team1,
	c2.teamName as team2
from cte c1
inner join cte c2
on c1.teamName <> c2.teamName

--SOLUTION:-2
select t1.teamName as team1, t2.teamName as team2
from teams t1
cross join teams t2
where t1.teamName <> t2.teamName

-- team1	team2
-- CSK		SRH
-- MI		SRH
-- SRH		CSK
-- MI		CSK
-- SRH		MI
-- CSK		MI