#!/bin/bash
jobstat | awk '{print $3}' | grep -v USER | sort | uniq -u | each_line.sh
