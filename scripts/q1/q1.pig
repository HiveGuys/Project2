--Change directory to local directory
REGISTER 'question1pig.py' USING jython as myfuncs;

--data = LOAD 'out/part-m-00000' using PigStorage('|')
data = LOAD 'data/Gender_StatsClean.csv' using PigStorage('|')
    AS (country_name: chararray, country_code: chararray, indicator_name: chararray, indicator_code: chararray, 
    y1960: double, y1961: double, y1962: double, y1963: double, y1964: double, y1965: double, y1966: double, y1967: double, y1968: double, y1969: double, y1970: double,
    y1971: double, y1972: double, y1973: double, y1974: double, y1975: double, y1976: double, y1977: double, y1978: double, y1979: double, y1980: double,
    y1981: double, y1982: double, y1983: double, y1984: double, y1985: double, y1986: double, y1987: double, y1988: double, y1989: double, y1990: double,
    y1991: double, y1992: double, y1993: double, y1994: double, y1995: double, y1996: double, y1997: double, y1998: double, y1999: double, y2000: double,
    y2001: double, y2002: double, y2003: double, y2004: double, y2005: double, y2006: double, y2007: double, y2008: double, y2009: double, y2010: double,
    y2011: double, y2012: double, y2013: double, y2014: double, y2015: double, y2016: double);

filter_data = filter data by indicator_name matches 'Educational attainment.*' and not(indicator_name matches '.*cumulative.*') and indicator_name matches '.*female.*';

result = foreach filter_data generate myfuncs.concat(country_name, indicator_name), myfuncs.recentYear(TOBAG(*)), myfuncs.recentValue(TOBAG(*));

newResult = filter result by not($2 == 'None');

--STORE newResult INTO 'hbase://question1' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
--'year:year_result,
-- value:value_result'
--);
store newResult into 'out/pig/q1' using PigStorage('|');