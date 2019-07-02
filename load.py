#!/bin/env python
import subprocess
import time
now = time.time()
uptime_proc = subprocess.Popen('uptime', stdout=subprocess.PIPE)
line = uptime_proc.stdout.readline()
a = line.split()
print(now, a[0], a[1], a[2], a[3])
file_out = open("uptime.txt", "a+")
file_out.write("%s,%s%s%s\n" % (now, a[10], a[11], a[12]))
file_out.close()
