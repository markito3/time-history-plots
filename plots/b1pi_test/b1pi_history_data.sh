#!/bin/bash
date_in=$1
if ! utime=`date -d $date_in +%s`
    then
    echo Error: could not get unixtime >&2
    exit 1
fi
export THP_HOME=/group/halld/Software/time-history-plots
root_output=`root -b -q '$THP_HOME/plots/b1pi_test/b1pi_mass_params.C("'$date_in'")' | grep hist_params: | awk -F"[,=]" 'BEGIN{ORS=""}{print ","$3","$5","$7","$9}'`
echo ${utime}${root_output}
