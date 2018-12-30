/*
make a table in HBase:
cloudera]$ hbase shell
hbase> create 'question5', 'question5_data'
hbase> exit

to run the pig script:
PIG_CLASSPATH=/usr/lib/hbase/hbase.jar:/usr/lib/zookeeper-3.4.5-cdh4.jar /usr/bin/pig /home/cloudera/Repositories/Temp/request5.pig
*/


REGISTER 'difference.py' USING jython as myfuncs;

-- data = load 'hdfs://quickstart.cloudera:8020/pig-stuff
data = load 'HData/Gender_StatsData.csv' using PigStorage('|') as (country_name:chararray, country_code:chararray, indicator_name:chararray, indicator_code:chararray, year1960:double, year1961:double, year1962:double, year1963:double, year1964:double, year1965:double, year1966:double, year1967:double, year1968:double, year1969:double, year1970:double, year1971:double, year1972:double, year1973:double, year1974:double, year1975:double, year1976:double, year1977:double, year1978:double, year1979:double, year1980:double, year1981:double, year1982:double, year1983:double, year1984:double, year1985:double, year1986:double, year1987:double, year1988:double, year1989:double, year1990:double, year1991:double, year1992:double, year1993:double, year1994:double, year1995:double, year1996:double, year1997:double, year1998:double, year1999:double, year2000:double, year2001:double, year2002:double, year2003:double, year2004:double, year2005:double, year2006:double, year2007:double, year2008:double, year2009:double, year2010:double, year2011:double, year2012:double, year2013:double, year2014:double, year2015:double, year2016:double);

filter_data = filter data by indicator_name == 'School enrollment, tertiary (gross), gender parity index (GPI)';

result = foreach filter_data generate country_name, indicator_name, myfuncs.earliestYear(TOBAG(*)), myfuncs.latestYear(TOBAG(*)), myfuncs.difference(TOBAG(*));

newResult = filter result by not($2 == 0) and not($3 == 0) and not($4 == 0.0);

--store newResult into 'pigout' using PigStorage('|');
STORE newResult INTO 'hbase://question5' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage('question5_data:indicator, question5_data:earliest_year, question5_data:latest_year, question5_data:difference');
