USE EMPDATA
--SQL MERGE
SELECT * FROM EMPLOYEE

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_CATALOG = 'EMPDATA';

CREATE TABLE PRODUCT_LIST ( PID INT, PNAME VARCHAR(20), PPRICE INT)
CREATE TABLE UPDATED_LIST ( PID INT, PNAME VARCHAR(20), PPRICE INT)

INSERT INTO PRODUCT_LIST VALUES (101,'TEA',10),(102,'COFFEE',15),(103,'BISCUIT',20);
INSERT INTO UPDATED_LIST VALUES (101,'TEA',10),(102,'COFFEE',25),(104,'CHIPS',22);

SELECT * FROM PRODUCT_LIST
SELECT * FROM UPDATED_LIST


MERGE PRODUCT_LIST AS TARGET
USING UPDATED_LIST AS SOURCE
ON TARGET.PID = SOURCE.PID

WHEN MATCHED
		AND TARGET.PNAME <> SOURCE.PNAME
		OR TARGET.PPRICE <> SOURCE.PPRICE
THEN UPDATE
		SET TARGET.PNAME = SOURCE.PNAME,
			TARGET.PPRICE = SOURCE.PPRICE


WHEN NOT MATCHED BY TARGET
THEN
		INSERT (PID, PNAME, PPRICE) VALUES (SOURCE.PID, SOURCE.PNAME, SOURCE.PPRICE)


WHEN NOT MATCHED BY SOURCE
THEN DELETE;