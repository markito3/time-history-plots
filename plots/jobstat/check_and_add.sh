#!/bin/bash
newuser=$1
if [ "$newuser" == "" ]
then
    exit 1
fi
known_users=/group/halld/time_history_data/known_users.txt
grep -q $newuser $known_users
status_grep=$?
if [ $status_grep != 0 ]
then
    echo $newuser not found, adding to list
    echo $newuser >> $known_users
fi
