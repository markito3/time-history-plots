#!/bin/bash
while IFS= read -r line
do
    check_and_add.sh "$line"
done
