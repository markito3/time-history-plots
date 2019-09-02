#!/bin/python
import subprocess

print("""\
<time_history_plot>
  <input_data_spec file="/group/halld/time_history_data/user_jobs.thdml"/>
  <time_scale scale="dummy_scale"/>
  <time_range type="latest" duration="dummy_duration"/>
  <time_zone offset="-04:00"/>""")


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
    #print('total jobs =', totalJobs)
    if totalJobs > 10:
        userIndex = (i - 1)/2 
        print('  <plot x="time" y="' + users[userIndex] + ' running"/>')
    i += 2
print("""\
  <time_zone offset="-04:00"/>
  <output type="png" file="dummy_file"/>
</time_history_plot>""")
