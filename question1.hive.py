import sys

for line in sys.stdin:
        splits = line.split('\t')
        count = 0
        country = 'none'
        ind = 'none'
        lastResult = 'None'
        year = 'None'
        printResult = 0
        for column in splits:
                if count == 0:
                        country = str(column)
                elif count == 2:
                        ind = str(column)
                elif count > 3:
                        if str(column).strip() != '\N':
                                year = 1960 + count - 4
                                if float(column) < 30:
                                        printResult = 1
                                else:
                                        printResult = 0
                                lastResult = str(column)
                count = count + 1
        if printResult == 1:   
                year = str(year)
                result = '\t'.join([country, ind, year, lastResult])
                print result