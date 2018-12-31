USE GENDER_STATISTICS;

add file  /home/cloudera/testscript.py;

DROP TABLE IF EXISTS QUESTION_3;

CREATE TABLE QUESTION_3
AS SELECT TRANSFORM (*)
USING 'python hivescript.py' 
AS (COUNTRY, INDICATION, CHANGE) 
FROM GENDER_STATS
--where clauses change these
WHERE INDICATOR_NAME LIKE 'Employment to population ratio, 15+, male (%) (modeled ILO estimate)%' 
AND (INDICATOR_NAME NOT LIKE '%cumulative%') 
AND (INDICATOR_NAME LIKE '%male%');
