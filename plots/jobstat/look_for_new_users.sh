#!/bin/bash
jobstat | awk '{print $3}' | grep -v USER | grep -v PD | sort -u | each_line.sh
