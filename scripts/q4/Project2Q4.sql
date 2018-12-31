USE GENDER_STATISTICS;

add file  /home/cloudera/hivescript.py;

DROP TABLE IF EXISTS QUESTION_4;

CREATE TABLE QUESTION_4
AS SELECT TRANSFORM (*)
USING 'python testscript.py' 
AS (COUNTRY, INDICATION, CHANGE)
FROM GENDER_STATS
WHERE INDICATOR_NAME='Employment to population ratio, 15+, female (%) (modeled ILO estimate)';
