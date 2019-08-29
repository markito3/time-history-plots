#!/bin/python
import subprocess
lastLineOutput = subprocess.Popen(['tail', '-1', '/home/marki/google_drive/scratch/user_jobs.txt'],stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
stdout,stderr = lastLineOutput.communicate()
print(stdout)
print(stderr)
lastLine = stdout.rstrip()
counts = lastLine.split(',')
print(counts)
