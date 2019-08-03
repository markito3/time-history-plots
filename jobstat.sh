#!/bin/bash
time=`date +%s`
jsout=/tmp/jobstat_output.txt
rm -f $jsout
/site/bin/jobstat | grep -v JOB_ID > $jsout
total=`grep ' R ' $jsout | wc -l`
production=`grep ' R ' $jsout | grep production | wc -l`
general=`grep ' R ' $jsout | grep general | wc -l`
priority=`grep ' R ' $jsout | grep priority | wc -l`
gxp=`grep ' R ' $jsout | grep gxproj | wc -l`
gxp1=`grep ' R ' $jsout | grep gxproj1 | wc -l`
gxp2=`grep ' R ' $jsout | grep gxproj2 | wc -l`
gxp3=`grep ' R ' $jsout | grep gxproj3 | wc -l`
gxp4=`grep ' R ' $jsout | grep gxproj4 | wc -l`
gxp5=`grep ' R ' $jsout | grep gxproj5 | wc -l`
gxp6=`grep ' R ' $jsout | grep gxproj6 | wc -l`
gxp7=`grep ' R ' $jsout | grep gxproj7 | wc -l`
gxp8=`grep ' R ' $jsout | grep gxproj8 | wc -l`
hdusers=`grep ' R ' $jsout | grep -e staylor -e andrsmit -e tbritton -e davild -e jrsteven -e sdobbs -e acernst -e aaustreg -e scole -e acschick | wc -l`
echo $time,$total,$production,$general,$priority,$gxp,$gxp1,$gxp2,$gxp3,$gxp4,$gxp5,$gxp6,$gxp7,$gxp8,$hdusers
