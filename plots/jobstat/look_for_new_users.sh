#!/bin/bash
jobstat | awk '{print $3}' | grep -v USER | \
    grep -v PD | \
    grep -v R | \
    grep -v CD | \
    grep -v H | \
    grep -v F | \
    grep -v CA | \
    grep -v O | \
    sort -u | each_line.sh
