@outputSchema("earliest_year:int")
def earliestYear(row):
	count = 0
	for i,k in enumerate(row):
		if count > 53 :
			data = str(k).split(",")
			if data[0] != '(None':       
				return (1960 + count - 4)
		count += 1
	return 0

@outputSchema("latest_year:int")      
def latestYear(row):
	count = 0
	latest_year_with_value = 0
	for i,k in enumerate(row):
		if count > 54 :
			data = str(k).split(",")
			if data[0] != '(None':
				latest_year_with_value = 1960 + count - 4
		count += 1
	return latest_year_with_value;

#double isn't a type in python, but float is.
#when comparing this function's result to 0.0, Pig implicitly casts 0.0 as 
#	a double, not a float. So pig can't check if this function's result
#	is 0.0 because pig is looking for a 0.0 double, not a 0.0 float.
@outputSchema("difference:double")      
def difference(row):
	first_value = 0.0
	last_value = 0.0
	lastResult = 'None'
	count = 0
	for i,k in enumerate(row):
		if count > 53 :
			data = str(k).split(",")
			if data[0] != '(None':       
				first_value = float(str(k)[1:-2])
				break
		count += 1
	count = 0
        for i,k in enumerate(row):
                if count > 54 :
                        data = str(k).split(",")
                        if data[0] != '(None':
                        	last_value = float(str(k)[1:-2])
                count += 1
	if (first_value!=0.0) and (last_value!=0.0) and (first_value!=last_value) and (first_value<1.0) and (last_value>first_value):
		return (last_value-first_value)
	return 0.0

