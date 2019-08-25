#!/bin/bash
newuser=$1
if [ "$newuser" == "" ]
then
    echo blank user, exiting
    exit 1
fi
known_users=/group/halld/time_history_data/known_users.txt
grep -q $newuser $known_users
status_grep=$?
if [ $status_grep == 0 ]
then
    echo $newuser found
else
    echo $newuser not found
    echo $newuser >> $known_users
fi
