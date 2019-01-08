@outputSchema("avg_graduation:double")
def rowAverage(row):
	count = 0
	yearOne = 0
	yearTwo = 0
	sumCount = 0
	average = 0
	prevResult = 0
	lastResult = 100
	for i,l in enumerate(row):
		if count > 44 :
			data = str(l).split(",")
			if data[0] != '(None':
				if prevResult == 0:
					prevResult = str(l)
					prevResult = float(prevResult[1:-2])
					yearOne = 1960 + count - 4
				else:
					result = str(l)
					result = float(result[1:-2])
					yearTwo = 1960 + count - 4
					average = average + (result - prevResult)
					sumCount = sumCount + 1
					yearOne = yearTwo
					prevResult = result
		count = count +  1
	return str(float(average) / float(sumCount))
