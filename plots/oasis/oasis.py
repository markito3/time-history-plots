#!/bin/env python
import subprocess
import time
now = time.time()
du_proc = subprocess.Popen(['du', '-s', '/cvmfs/oasis.opensciencegrid.org/gluex/group'], stdout=subprocess.PIPE)
line = du_proc.stdout.readline()
a = line.split()
size_kB = float(a[0])
size_GB = size_kB/1024.0/1024.0
#print(now, size_GB)
file_out = open("/group/halld/time_history_data/oasis.txt", "a+")
file_out.write("%s,%s\n" % (now, size_GB))
file_out.close()
