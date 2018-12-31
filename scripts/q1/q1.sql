USE GENDER_STATS;

DROP TABLE IF EXISTS QUESTION_1;

--Change directory to local directory
add file  hdfs:///user/p2/scripts/q1/question1.hive.py;

DROP TABLE IF EXISTS QUESTION_1;

CREATE TABLE QUESTION_1
AS SELECT TRANSFORM (*)
USING 'python question1.hive.py' 
AS (COUNTRY, IND, YEAR, LASTRESULT) 
FROM GENDER
WHERE INDICATOR_NAME LIKE 'Educational attainment%' 
AND (INDICATOR_NAME NOT LIKE '%cumulative%') 
AND (INDICATOR_NAME LIKE '%female%');