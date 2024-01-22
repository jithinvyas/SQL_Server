--1. Display EMPNO, ENAME, DEPTNO of those EMPLOYEES who are working at 10, 30 Departments.
select EMPNO, ENAME, DEPTNO from emp where DEPTNO = 10 or DEPTNO = 30;

--2.  Display ENAME, JOB, SAL, COMM and DEPTNO who are working as SALESMAN at DEPTNO 30 and 
--    there commission is > half of their salary.
select ENAME, JOB, SAL, COMM, DEPTNO from EMP
where JOB = 'SALESMAN' and
DEPTNO = 30 and
COMM > SAL/2;

--3.  Display EMPNO, ENAME & MGR of those Employees who don’t have manager to report.
select EMPNO,ENAME,MGR from EMP
where MGR IS NULL;

--4. Display EMPNO, ENAME, MGR, SAL and COMM of those Employees 
--   who have managers to report and do not earn commission.
SELECT EMPNO, ENAME, MGR, SAL, COMM FROM EMP
WHERE MGR IS NOT NULL 
AND COMM IS NULL OR COMM = 0;

--5. Display all the employees from the EMP table with 
--   half of the string in upper case and next string in lower case
SELECT LEFT(ENAME, CEILING( LEN(ENAME)/2.0 )) + LOWER( RIGHT(ENAME, LEN(ENAME)/2 ) ) FROM EMP;

SELECT LEFT (ENAME, CEILING (LEN (ENAME)/2.0)) + LOWER(RIGHT (ENAME, CEILING (LEN (ENAME)/2))) FROM EMP

--6. Display all Employees whose name contains 3rd Character as ‘L’.
SELECT ENAME FROM EMP
WHERE ENAME LIKE '__L%';

--7. Display all Employees whose name contains A at second occurance.
SELECT ENAME FROM EMP
WHERE ENAME LIKE '_A%';

--8. Display all those Employees data that have been hired on Sunday.
SELECT * FROM EMP 
WHERE DATEPART(DW,HIREDATE) = 1;

SELECT * FROM EMP
WHERE DATENAME(WEEKDAY,HIREDATE) = 'SUNDAY';

--9.  Display all those Employees who have been hired in second half of the week.
SELECT *, DATENAME(DW,HIREDATE) FROM EMP
WHERE DATENAME(DW,HIREDATE) IN ('THURSDAY','FRIDAY','SATURDAY');

SELECT *, DATEPART(WEEKDAY,HIREDATE) AS WEEKDAY FROM EMP
WHERE DATEPART(DW,HIREDATE) > ROUND(7/2.0,0);

SELECT * FROM EMP WHERE DATEPART(DW,HIREDATE)>4

--10. Display ENAME, DEPTNO, SAL and INCREMENT the Salary with different %’s 
--    on category of Dept No 10 – 20%, Dept no 20 – 18%, Dept no 30 – 15%
SELECT ENAME, DEPTNO, SAL,
CASE DEPTNO
	WHEN 10 THEN SAL + SAL*0.2
	WHEN 20 THEN SAL + SAL*0.18
	WHEN 30 THEN SAL + SAL*0.15
END AS UPDATEDSAL
FROM EMP;

--11. Display total salaries of individual departments in a single row.
SELECT DEPTNO,SUM(SAL) AS TOTALSAL FROM EMP
GROUP BY DEPTNO;

SELECT DNAME,SUM(SAL) AS TOTAL_SAL FROM(
	SELECT E.DEPTNO,D.DNAME,E.SAL FROM EMP E
	JOIN DEPT D
	ON E.DEPTNO = D.DEPTNO) X
GROUP BY X.DNAME

--12. Display the departments where more than 3 Employees are working.
SELECT DEPTNO,COUNT(*) AS ECOUNT FROM EMP
GROUP BY DEPTNO
HAVING COUNT(ENAME)>3;

--13. Display EMPNO, ENAME, DNAME, LOC, and GRADE of all the Employees.
SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL

--14. Display ENAME, JOB, SAL, COMM, DEPTNO, DNAME, LOC & GRADE of all those Employees
--	  who are working at “ACCOUNTING, SALES” and they have managers to report and 
--	  they don’t earn commission and their Salary more than 1000, arrange the data in ascending order.
SELECT E.ENAME, E.JOB, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE DNAME IN ('ACCOUNTING','SALES') 
AND MGR IS NOT NULL
AND COMM IS NULL
AND SAL>1000
ORDER BY SAL;

--15. Display EMPNO, ENAME, JOB, SAL of those Employees whose salary is more than Average Salary of all Employees
SELECT EMPNO, ENAME, JOB, SAL FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP)

--16. Write a Query to display First 3 Max Salaries of Employees.
SELECT TOP 3 SAL FROM EMP
ORDER BY SAL DESC

--17. Dislay ENAME, JOB, SAL, DEPTNO of those Employees whose salary is more than Max Sal of Sales Department
SELECT E.ENAME, E.JOB, E.SAL, E.DEPTNO FROM EMP E
WHERE SAL > (SELECT MAX(SAL) FROM EMP E
				JOIN DEPT D ON E.DEPTNO = D.DEPTNO
				WHERE D.DNAME = 'SALES')

--18.  Display DEPTNO & Average Salary of those departments whose average salary is 
--     more than the average salary of all Employees.
SELECT DEPTNO, AVG(SAL) AS AVGSAL FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > (SELECT AVG(SAL) FROM EMP)

--19. Write a Query to display Nth Maximum Salary Earning Employees.
SELECT ENAME, SAL FROM (SELECT ENAME, SAL,ROW_NUMBER() 
						OVER (ORDER BY SAL ASC) AS RANKING FROM EMP) AS NSAL
		WHERE RANKING = 7

--20. Write a query to display all thoose Employees whose record position at even numbers
SELECT EMPNO, ENAME FROM (SELECT EMPNO, ENAME, ROW_NUMBER()
							OVER(ORDER BY EMPNO) AS RANKING FROM EMP) AS EVERECS 
		WHERE RANKING % 2 = 0
 
--21. Write a query to display every Forth Record of EMP Table.
SELECT * FROM
(SELECT *,ROW_NUMBER() OVER(ORDER BY EMPNO) AS RANKING FROM EMP) AS FOURTHREC
WHERE RANKING % 4 =0

--22. Display EMPNO,ENAME,JOB,SAL,DEPTNO of those Employees whose salary is more than AVERAGE SALARY of respective Departments
SELECT EMPNO,ENAME,SAL,DEPTNO FROM EMP E WHERE SAL > (SELECT AVG(SAL) FROM EMP
WHERE DEPTNO = E.DEPTNO)

--23. Update the JOB, SAL of MARTIN from SALESMAN to CLERK and 1250 to 2000
SELECT * INTO EMP1 FROM EMP  --DROP TABLE EMP1;

UPDATE EMP1 SET JOB = 'CLEARK', SAL=2000 WHERE ENAME = 'MARTIN'
--CHECKING
SELECT * FROM EMP
SELECT * FROM EMP1

--24)Update the Salary of ALLEN with an increament of 1000, Sal of JAMES with 500 and other Employees sal should remain unchanged
UPDATE EMP1 SET SAL =
CASE
	WHEN ENAME = 'ALLEN' THEN SAL+1000
	WHEN ENAME = 'JAMES' THEN SAL+500
	ELSE SAL
END

--25. Update the Salary of 30 Department with the Average Salary of 20 Department
UPDATE EMP1 SET SAL = (SELECT AVG(SAL) FROM EMP1 WHERE DEPTNO = 20) WHERE DEPTNO = 30
--CHECKING
SELECT * FROM EMP
SELECT * FROM EMP1

--26. Display total salaries of individual departments in a single row.
SELECT 
SUM(CASE 
WHEN DEPTNO = '10' THEN SAL ELSE 0 END) AS D10,
SUM(CASE
WHEN DEPTNO = '20' THEN SAL ELSE 0 END) AS D20,
SUM(CASE
WHEN DEPTNO = '30' THEN SAL ELSE 0 END) AS D30
FROM EMP
