#!/bin/env python
import subprocess
import time
now = time.time()
df_proc = subprocess.Popen(['df', '/group/halld/', '/work/halld/'], stdout=subprocess.PIPE)
line = df_proc.stdout.readline()
line = df_proc.stdout.readline()
a = line.split()
gsize = a[1]
gused = a[2]
gavail = a[3]
line = df_proc.stdout.readline()
a = line.split()
wsize = a[1]
wused = a[2]
wavail = a[3]
line = df_proc.stdout.readline()
a = line.split()
w3size = 0
w3used = 0
w3avail = 0
file_out = open("/group/halld/time_history_data/df.txt", "a+")
file_out.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" % (now, gsize, gused, gavail, wsize, wused, wavail, w3size, w3used, w3avail))
file_out.close()
