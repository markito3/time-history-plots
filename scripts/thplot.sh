#!/bin/bash
date=`date +%s.%N`
gplt_dir=/tmp/gplt_${USER}
mkdir -p $gplt_dir
gplt_file=$gplt_dir/${date}.gplt
if [ $1 == '-b' ]
then
    arg='-b'
    input_file=$2
else
    arg=''
    input_file=$1
fi
make_gplt.py $arg $input_file > $gplt_file
status=$?
if [ $status -eq 0 ]
   then
   gnuplot $gplt_file
fi
