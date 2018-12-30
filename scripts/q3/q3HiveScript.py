#hive       
import sys

for line in sys.stdin:
        splits = line.split('\t')
        count = 0
        country = 'none'
        ind = 'none'
        lastResult = 'None'
        yearOne = 0
        yearTwo = 0
        yearDif = 0
        prevResult = 0
        result = 0
        average = 0
        sumCount = 0
        for column in splits:
                if count == 0:
                        country = str(column)
                elif count == 2:
                        ind = str(column)
                elif count > 44:
                        if str(column).strip() != '\N':
                                if prevResult == 0:
                                    prevResult = float(column)
                                    yearOne = 1960 + count - 4
                                else:
                                    result = float(column)
                                    yearTwo = 1960 + count - 4
                                    yearDif = yearTwo - yearOne
                                    average = average + (result - prevResult)
                                    sumCount = sumCount + 1
                                    yearOne = yearOne
                                    prevResult = result
                count = count + 1
        lastResult = float(average) / float(sumCount)
        result = '\t'.join([country, ind, lastResult])
        print result
