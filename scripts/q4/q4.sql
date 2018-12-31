USE GENDER_STATS;

add file  hdfs:///user/p2/scripts/q2/hivetest.py;

DROP TABLE IF EXISTS QUESTION_4;

CREATE TABLE QUESTION_4
AS SELECT TRANSFORM (*)
USING 'python hivescript.py' 
AS (COUNTRY, INDICATION, CHANGE)
FROM GENDER
WHERE INDICATOR_NAME='Employment to population ratio, 15+, female (%) (modeled ILO estimate)';
