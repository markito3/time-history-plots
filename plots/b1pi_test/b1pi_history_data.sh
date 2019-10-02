#!/bin/bash
date_in=$1
utime=`date -d $date_in +%s`
root_output=`root -b -q 'b1pi_mass_params.C("'$date_in'")' | grep hist_params: | awk -F"[,=]" 'BEGIN{ORS=""}{print ","$3","$5","$7","$9}'`
echo ${utime}${root_output}
