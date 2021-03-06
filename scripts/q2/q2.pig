register 'test.py' using jython as myfuncs;

data = load 'data/Gender_StatsClean.csv' using PigStorage('|') AS(COUNTRY_NAME:chararray, COUNTRY_CODE:chararray, INDICATOR_NAME:chararray, INDICATOR_CODE:chararray, y1960:double, y1961:double, y1962:double, y1963:double, y1964:double, y1965:double, y1966:double, y1967:double, y1968:double, y1969:double, y1970:double, y1971:double, y1972:double, y1973:double, y1974:double, y1975:double, y1976:double, y1977:double, y1978:double, y1979:double, y1980:double, y1981:double, y1982:double, y1983:double, y1984:double, y1985:double, y1986:double, y1987:double, y1988:double, y1989:double, y1990:double, y1991:double, y1992:double, y1993:double, y1994:double, y1995:double, y1996:double, y1997:double, y1998:double, y1999:double, y2000:double, y2001:double, y2002:double, y2003:double, y2004:double, y2005:double, y2006:double, y2007:double, y2008:double, y2009:double, y2010:double, y2011:double, y2012:double, y2013:double, y2014:double, y2015:double, y2016:double);


q2_filter1 = filter data by COUNTRY_CODE == 'USA';

q2_filter = filter q2_filter1 by INDICATOR_CODE == 'SE.TER.CMPL.FE.ZS' OR INDICATOR_CODE == 'SE.TER.CMPL.MA.ZS';

q2_avg = foreach q2_filter generate COUNTRY_NAME, myfuncs.rowAverage(TOBAG(*));

store q2_avg into 'out/pig/q2' using PigStorage('|');