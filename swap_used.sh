#!/bin/bash
rm -f /tmp/swap.gplt
make_gplt.py swap_plot.xml > /tmp/swap.gplt
xterm -e gnuplot /tmp/swap.gplt &
