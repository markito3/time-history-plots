#!/bin/bash
jobstat | awk '{print $3}' | grep -v USER | sort -u | each_line.sh
