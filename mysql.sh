#!/bin/bash
date=`date +%s`
total=`mysql -B -N -hhallddb -umarki -phybrid information_schema -e 'select count(*) from processlist'`
ccdb_farm=`mysql -B -N -hhallddb -uccdb_user information_schema -e 'select count(*) from processlist where user = "ccdb_user" and (host like "farm%" or host like "qcd%")'`
echo $date,$total,$ccdb_farm
echo $date,$total,$ccdb_farm >> mysql.txt
