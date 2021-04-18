#!/bin/bash
debug=false
date=`date +%s`
if [ $debug = "true" ]; then echo hallddb; fi
hallddb=`mysql -B -N -hhallddb -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo hallddb_ext; fi
hallddb_ext=`mysql -B -N -hhallddb-ext -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo halldweb; fi
halldweb=`mysql -B -N -hhalldweb -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo ccdb_farm; fi
ccdb_farm=`mysql -B -N -hhallddb -uccdb_user information_schema -e 'select count(*) from processlist where user = "ccdb_user" and (host like "farm%" or host like "qcd%")'`
if [ $debug = "true" ]; then echo hallddb-a; fi
hallddb_a=`mysql -B -N -hhallddb-a -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo hallddb-b; fi
hallddb_b=`mysql -B -N -hhallddb-b -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo hallddb-c; fi
hallddb_c=`mysql -B -N -hhallddb-c -umarki -phybrid information_schema -e 'select count(*) from processlist'`
if [ $debug = "true" ]; then echo hallddb-d; fi
#hallddb_d=`mysql -B -N -hhallddb-d -umarki -phybrid information_schema -e 'select count(*) from processlist'`
echo $date,$hallddb,$ccdb_farm,$hallddb_ext,$halldweb,$hallddb_a,$hallddb_b,$hallddb_c,$hallddb_d >> /group/halld/time_history_data/mysql.txt
