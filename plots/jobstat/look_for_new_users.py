#!/usr/bin/env python
import subprocess

jobstatOutput = subprocess.check_output(['jobstat'])
print(jobstatOutput[0])
jobstatLines = jobstatOutput.splitlines()
print(jobstatLines[0])
for i in range(1, len(jobstatLines)):
    print(i, jobstatLines[i])

