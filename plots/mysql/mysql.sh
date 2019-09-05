#!/bin/bash
date=`date +%s`
hallddb=`mysql -B -N -hhallddb -umarki -phybrid information_schema -e 'select count(*) from processlist'`
hallddb_ext=`mysql -B -N -hhallddb-ext -umarki -phybrid information_schema -e 'select count(*) from processlist'`
halldweb=`mysql -B -N -hhalldweb -umarki -phybrid information_schema -e 'select count(*) from processlist'`
ccdb_farm=`mysql -B -N -hhallddb -uccdb_user information_schema -e 'select count(*) from processlist where user = "ccdb_user" and (host like "farm%" or host like "qcd%")'`
echo $date,$hallddb,$ccdb_farm,$hallddb_ext,$halldweb >> /group/halld/time_history_data/mysql.txt
