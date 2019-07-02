#!/bin/env python
from datetime import datetime
file_out = open("plot.txt", "w")
with open("free.txt") as file_in:
    for line in file_in:
        print(line)
        a = line.split(',')
        time = a[0]
#        dt = datetime.fromtimestamp(float(time))
#        print dt
        value = a[8]
        file_out.write("%s %s\n" % (time, value))
file_out.close()
