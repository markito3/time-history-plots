#!/bin/env python
import subprocess
import time
import random
now = time.time()
du_proc = subprocess.Popen(['du', '-s', '/cvmfs/oasis.opensciencegrid.org/gluex/group'], stdout=subprocess.PIPE)
line = du_proc.stdout.readline()
a = line.split()
size_kB = float(a[0])
# add a random number to the size to avoid plots with no y-range
size_GB = size_kB/1024.0/1024.0 + random.uniform(-0.1, 0.1)
#print(now, size_GB)
file_out = open("/group/halld/time_history_data/oasis.txt", "a+")
file_out.write("%s,%s\n" % (now, size_GB))
file_out.close()
