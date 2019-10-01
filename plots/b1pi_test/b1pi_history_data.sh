#!/bin/bash
date -d 2019-01-01 +%s
root -b -q b1pi_mass_params.C | grep hist_params: | awk -F"[,=]" 'BEGIN{ORS=""}{print ","$3","$5","$7","$9}'
echo
