@outputSchema("country_indicator:chararray")
def concat(left, right):
        result = str(left) + ": " + str(right)
        return result

@outputSchema("year_result:chararray")
def recentYear(row):
        count = 0
        year = 1960
        lastResult = 100
        for i,l in enumerate(row):
                if count > 3 :
                        data = str(l).split(",")
                        if data[0] != '(None':
                                year = 1960 + count - 4
                                result = str(l)
                                result = result[1:-2]
                                lastResult = result
                count = count +  1
        return year

@outputSchema("value_result:chararray")
def recentValue(row):
        count = 0
        year = 1960 
        lastResult = 100
        for i,l in enumerate(row):
                if count > 3 :
                        data = str(l).split(",")
                        if data[0] != '(None':
                                year = 1960 + count - 4
                                result = str(l)
                                result = result[1:-2] 
                                lastResult = result
                count = count +  1
        if float(lastResult) < 30.0:
                return str(lastResult)
        else:
                return 'None'
