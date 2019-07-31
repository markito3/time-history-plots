#!/bin/env python

import sys
import time
from xml.dom.minidom import parse
import xml.dom.minidom

configFile = sys.argv[1]

now = time.time()

def get_data_specs():
    DOMTreeData = xml.dom.minidom.parse(input_data_spec_file)
    dataConfig = DOMTreeData.documentElement
    input_data_array = dataConfig.getElementsByTagName('input_data')
    input_data = input_data_array[0] # first one and first one only
    global data_file
    data_file = input_data.getAttribute('file')
    columns_array = dataConfig.getElementsByTagName('columns')
    columns_node = columns_array[0] # first one and first one only
    column_array = columns_node.getElementsByTagName('column')
    global position_dict
    position_dict = {}
    for i in range(column_array.length):
        position_dict[column_array[i].getAttribute('name')] = column_array[i].getAttribute('position')

DOMTreePlot = xml.dom.minidom.parse(configFile)
plotConfig = DOMTreePlot.documentElement
input_data_spec_array = plotConfig.getElementsByTagName('input_data_spec')
input_data_spec = input_data_spec_array[0] # first one and first one only
input_data_spec_file = input_data_spec.getAttribute('file')
get_data_specs()
time_scale = plotConfig.getElementsByTagName('time_scale')
ts_element = time_scale[0] # first one and first one only
scale = ts_element.getAttribute('scale')
time_range = plotConfig.getElementsByTagName('time_range')
tr_element = time_range[0] # first one and first one only
duration = float(tr_element.getAttribute('duration'))
time_end = now
tu = 24*60*60
time_start = time_end - duration*tu

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
