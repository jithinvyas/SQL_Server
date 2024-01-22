SELECT LEN ('JITHIN VYAS') LEGTH;
SELECT DATALENGTH('JITHIN VYAS') CHAR_COUNT;

SELECT LTRIM ('    JITHIN VYAS   ',2) 
SELECT RTRIM ('JITHIN'          ,2) AS RTM
SELECT LEFT ('JITHIN VYAS', 3) AS LPART
SELECT RIGHT('JITHIN VYAS',3)  RPART
SELECT UPPER ('jithIN')
SELECT LOWER ('JITHIn')
SELECT SUBSTRING('jithinvyas2001@gmail.com',7,6) SUBSTR
SELECT CHARINDEX('a','@vyas2001a') CHARIND
SELECT CHARINDEX('a','@vyas2001a',5) CHARIND

SELECT PATINDEX('%schools%', 'W3Schools.com') PATINDX
SELECT REPLACE('JITHIN_VYAS','VYAS','JANGA') AS REPLACING;
SELECT REVERSE ('JITHIN_VYAS') AS REVERSING;
SELECT STUFF ('JITHIN',2,2,'vyas') AS STUFFING;
SELECT REPLICATE ('JITHIN', 2) AS REPEATING;

--> CONCAT functions types
SELECT CONCAT('SQL', ' ', 'is', ' ', 'fun!');
SELECT 'W3Schools' + '.com' as concat_with_plus;  ----> Concat with +
SELECT CONCAT_WS('--', 'www', 'W3Schools', 'com',' is a website'); ----> .split('--')

SELECT STUFF('SQL Tutorial', 5, 0, 'HTML') substitute;   ---> like value gets substituted in variable
SELECT TRANSLATE('Monday', 'Monday', 'Sunday'); ---> Results in Sunday

SELECT UNICODE('Atlanta');         ----> Ascii

-- Math Functions
SELECT LOG(2, 4);
SELECT SQRT(65535+1);
SELECT SQUARE(4) as sqr;
SELECT COS(0);
select sin(90)


SELECT SOUNDEX('Juice') n1, SOUNDEX('Banana') n2;
