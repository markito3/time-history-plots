#!/bin/env python

import sys
import time
from xml.dom.minidom import parse
import xml.dom.minidom

configFile = sys.argv[1]

now = time.time()

DOMTree = xml.dom.minidom.parse(configFile)
plotConfig = DOMTree.documentElement
input_data = plotConfig.getElementsByTagName('input_data')
id_element = input_data[0] # first one and first one only
data_file = id_element.getAttribute('file')
time_scale = plotConfig.getElementsByTagName('time_scale')
ts_element = time_scale[0] # first one and first one only
scale = ts_element.getAttribute('scale')
time_range = plotConfig.getElementsByTagName('time_range')
tr_element = time_range[0] # first one and first one only
duration = float(tr_element.getAttribute('duration'))
time_end = now
tu = 24*60*60
time_start = time_end - duration*tu

columns_array = plotConfig.getElementsByTagName('columns')
columns_node = columns_array[0] # first one and first one only
column_array = columns_node.getElementsByTagName('column')
position_dict = {}
for i in range(column_array.length):
    position_dict[column_array[i].getAttribute('name')] = column_array[i].getAttribute('position')

plot_array = plotConfig.getElementsByTagName('plot')
plot_node = plot_array[0]
xcolname = plot_node.getAttribute('x')
ycolname = plot_node.getAttribute('y')

print 'set datafile separator ","'
print 'set xdata time'
print 'set timefmt "%s"'
print 'set xrange ["' + str(time_start) + '":"' + str(time_end) + '"]'
if scale == 'few days':
    print 'set format x "%dd%Hh"'
else:
    print 'set format x "%m/%d"'
print 'plot \'' + data_file + '\' using ' + position_dict[xcolname] + ':' + position_dict[ycolname]
print 'pause -1 "Hit any key to continue"'
