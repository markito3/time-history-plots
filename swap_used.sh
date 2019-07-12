#!/bin/bash
rm -f /tmp/free.gplt
make_gplt.py free.xml > /tmp/free.gplt
xterm -e gnuplot /tmp/free.gplt &
