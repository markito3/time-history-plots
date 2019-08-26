#!/bin/bash
time=`date +%s`
dataline=$time
jsfile=/tmp/jobstat_for_user_jobs.txt
rm -f $jsfile
jobstat > $jsfile
while read -r user
do
    total=`grep " $user " $jsfile | wc -l`
    running=`grep " $user " $jsfile | grep " R " | wc -l`
    dataline=${dataline},${total},${running}
done < known_users.txt
echo $dataline >> user_jobs.txt
