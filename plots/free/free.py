#!/bin/env python
import subprocess
import time
now = time.time()
free_proc = subprocess.Popen('free', stdout=subprocess.PIPE)
line = free_proc.stdout.readline()
line = free_proc.stdout.readline()
a = line.split()
line = free_proc.stdout.readline()
b = line.split()
#print(now, a[1], a[2], a[3], a[4], a[5], a[6], b[1], b[2], b[3])
file_out = open("/group/halld/time_history_data/free.txt", "a+")
file_out.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" % (now, a[1], a[2], a[3], a[4], a[5], a[6], b[1], b[2], b[3]))
file_out.close()
