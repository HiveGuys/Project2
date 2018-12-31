USE GENDER_STATISTICS;

add file  /home/cloudera/q3HiveScript.py;

DROP TABLE IF EXISTS QUESTION_3;

CREATE TABLE QUESTION_3
AS SELECT TRANSFORM (*)
USING 'python testscript.py' 
AS (COUNTRY, INDICATION, CHANGE)
FROM GENDER_STATS
WHERE INDICATOR_NAME='Employment to population ratio, 15+, male (%) (modeled ILO estimate)';
