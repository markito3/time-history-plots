#!/bin/python
import subprocess

print("""\
<time_history_plot>
  <input_data_spec file="/group/halld/time_history_data/user_jobs.thdml"/>
  <time_scale scale="dummy_scale"/>
  <time_range type="latest" duration="dummy_duration"/>
  <time_zone offset="-05:00"/>""")


with open('known_users.txt') as ku:
    users = ku.readlines()
users = [x.strip() for x in users]

lastLineOutput = subprocess.Popen(['tail', '-1', '/group/halld/time_history_data/user_jobs.txt'],stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
stdout,stderr = lastLineOutput.communicate()
lastLine = stdout.rstrip()
#print('lastLine =', lastLine)
counts = lastLine.split(',')
i = 1
while i < len(counts):
    totalJobs = int(counts[i])
    runningJobs = int(counts[i + 1])
    if totalJobs > 10 and runningJobs > 1:
        userIndex = (i - 1)/2 
        print('  <plot x="time" y="' + users[userIndex] + ' running"/>')
    i += 2
print("""\
  <time_zone offset="-05:00"/>
  <logy/>
  <output type="png" size="1024,720" file="dummy_file"/>
</time_history_plot>""")
