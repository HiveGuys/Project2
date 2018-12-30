USE GENDER_STATISTICS;

DROP TABLE IF EXISTS QUESTION_1;

--Change directory to local directory
add file  /home/cloudera/question1hive.py;

DROP TABLE IF EXISTS QUESTION_1;

CREATE TABLE QUESTION_1
AS SELECT TRANSFORM (*)
USING 'python question1hive.py' 
AS (COUNTRY, INDICATION, YEARR, PERCENT) 
FROM GENDER_STATS
WHERE INDICATOR_NAME LIKE 'Educational attainment%' 
AND (INDICATOR_NAME NOT LIKE '%cumulative%') 
AND (INDICATOR_NAME LIKE '%female%');