USE GENDER_STATS;

add file  hdfs:///user/p2/scripts/q2/hivetest.py;

DROP TABLE IF EXISTS QUESTION_3;

CREATE TABLE QUESTION_3
AS SELECT TRANSFORM (*)
USING 'python q3HiveScript.py' 
AS (COUNTRY, INDICATION, CHANGE)
FROM GENDER
WHERE INDICATOR_NAME='Employment to population ratio, 15+, male (%) (modeled ILO estimate)';
