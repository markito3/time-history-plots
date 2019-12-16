#!/bin/bash
jobstat | awk '{print $3}' | grep -v USER | \
    grep -v PD | \
    grep -v R | \
    grep -v CD | \
    grep -v H | \
    grep -v F | \
    grep -v CA | \
    grep -v O | \
    grep -v CG | \
    grep -v production | \
    sort -u | each_line.sh
