import sys

for line in sys.stdin:
    splits = line.split('\t')
    count = 0
    country = 'none'
    ind = 'none'
    lastResult = 'None'
    year = 'None'
    firstYear = 0
    secondYear = 0
    firstVal = 0
    secondVal = 0
    for column in splits:
        if count == 0:
            country = str(column)
        elif count == 2:
            ind = str(column)
        elif count > 53:
            if str(column).strip() != '\N':
                if firstYear == 0:
                    firstYear = 1960 + count - 4
                    firstVal = float(column)
                else:
                    secondYear = 1960 + count - 4
                    secondVal = float(column)
        count = count + 1
    if (firstYear != secondYear) and (secondYear != 0) and (firstYear != 0):  
        difference = str(secondVal - firstVal)
        firstYear = str(firstYear)
        secondYear = str(secondYear)
        result = '\t'.join([country, ind, difference])
        print result
