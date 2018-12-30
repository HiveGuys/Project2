@outputSchema("year_result:chararray")

def laborPercentChange(row):
	count = 0
	changes = []
	lastValue = 'None'
	duplicates = 1
	
	for i,l in enumerate(row):
		if count > 44 :
			data = str(l).split(",")
			##add 1 to duplicate to account for missing values
			if data[0] == '(None':
				if lastValue != 'None':
					duplicates = duplicates + 1
			if data[0] != '(None':
				result = str(l)
				result = eval(result[1:-2])
				
				#initialize lastValue when first column with value pops up. 		
				if lastValue == 'None':
					lastValue = result
				##divide by duplicates to fill out empty data spaces between 2 data pts.
				else:
					difference = (float(result) - float(lastValue)) / float(duplicates)
					for i in range(duplicates):
						changes.append(difference)
					duplicates = 1
		count = count + 1

	sizeList = len(changes)

	if sizeList == 0:
		return str(None)
	else:
		sum = 0
		
		for i in range(sizeList):
			sum += changes[i]
		return str(sum / sizeList)
