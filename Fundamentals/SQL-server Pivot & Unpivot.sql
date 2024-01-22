SELECT * FROM SYS.TABLES

-- Create a sample table
CREATE TABLE Sales (
    Year INT,
    Quarter VARCHAR(10),
    Revenue DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO Sales (Year, Quarter, Revenue)
VALUES
    (2021, 'Q1', 1000.00),
    (2021, 'Q2', 1500.00),
    (2021, 'Q3', 1800.00),
    (2021, 'Q4', 2000.00),
    (2022, 'Q1', 1200.00),
    (2022, 'Q2', 1600.00),
    (2022, 'Q3', 1900.00),
    (2022, 'Q4', 2100.00);
SELECT * FROM SALES


--PIVOT OPERATION -----> Transforming rows into columns
SELECT * INTO PT FROM 
(SELECT YEAR,QUARTER,REVENUE FROM SALES) AS SOURCE_TABLE
PIVOT (
	SUM(REVENUE) FOR QUARTER IN ([Q1],[Q2],[Q3],[Q4])
) AS PIVOT_TABLE

SELECT * FROM pt



--UNPIVOT OPERATION -----> Transforming columns into rows
SELECT YEAR,QUARTER,REVENUE FROM
(SELECT * FROM PT) AS SRC_TABLE
UNPIVOT(
	REVENUE FOR QUARTER IN ([Q1],[Q2],[Q3],[Q4])
) AS UNPIVOT_TABLE

SELECT * FROM SALES
