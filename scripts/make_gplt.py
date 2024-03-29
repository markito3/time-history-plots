#!/bin/env python2

import sys
import time
import xml.dom.minidom
import os.path

if sys.argv[1] == '-b':
    # batch mode
    batch_mode = True
    configFile = sys.argv[2]
else:
    # interactive mode
    batch_mode = False
    configFile = sys.argv[1]

now = time.time()
data_file = ''

def get_data_specs():
    DOMTreeData = xml.dom.minidom.parse(input_data_spec_file)
    dataConfig = DOMTreeData.documentElement
    input_data_array = dataConfig.getElementsByTagName('input_data')
    input_data = input_data_array[0] # first one and first one only
    global data_file
    data_file = input_data.getAttribute('file')
    if not os.path.isfile(data_file):
        sys.stderr.write('Error: data file ' + data_file + ' requested in ' + input_data_spec_file + ' does not exist or is not a regular file\n')
        sys.exit(1)
    columns_array = dataConfig.getElementsByTagName('columns')
    columns_node = columns_array[0] # first one and first one only
    column_array = columns_node.getElementsByTagName('column')
    global position_dict
    position_dict = {}
    for i in range(column_array.length):
        position_dict[column_array[i].getAttribute('name')] = column_array[i].getAttribute('position')

DOMTreePlot = xml.dom.minidom.parse(configFile)
plotConfig = DOMTreePlot.documentElement
title = ''
title_array = plotConfig.getElementsByTagName('title')
if title_array.length > 0:
    title_element = title_array[0]
    title = title_element.firstChild.nodeValue
input_data_spec_array = plotConfig.getElementsByTagName('input_data_spec')
input_data_spec = input_data_spec_array[0] # first one and first one only
input_data_spec_file = input_data_spec.getAttribute('file')
get_data_specs()
time_scale = plotConfig.getElementsByTagName('time_scale')
ts_element = time_scale[0] # first one and first one only
scale = ts_element.getAttribute('scale')
time_range = plotConfig.getElementsByTagName('time_range')
tr_element = time_range[0] # first one and first one only
range_type = tr_element.getAttribute('type')
range_offset_raw = tr_element.getAttribute('offset')
duration = float(tr_element.getAttribute('duration'))
time_zone_array = plotConfig.getElementsByTagName('time_zone')
logy_array = plotConfig.getElementsByTagName('logy')

if len(time_zone_array) > 0:
    time_zone = time_zone_array[0]
    offset = time_zone.getAttribute('offset')
    sign = offset[0]
    if sign == '+':
        sign_factor = 1
    elif sign == '-':
        sign_factor = -1
    else:
        sys.exit('time zone not well-formed, "-05:00" for EST is an example of a good one')
    hours = float(offset[1:3])
    minutes = float(offset[4:6])
    offset_seconds = sign_factor*60*(60*hours + minutes)
else:
    offset_seconds = 0

if title != '':
    print 'set title "' + title + '"' 
print 'set datafile separator ","'
print 'set key box top left'
print 'set grid'
print 'set xdata time'
print 'set timefmt "%s"'
if scale == 'seconds':
    tu = 1
    print 'set format x "%M%S"'
elif scale == 'minutes':
    tu = 60
    print 'set format x "%H:%M"'
elif scale == 'hours':
    tu = 60*60
    print 'set format x "%H:%M"'
elif scale == 'days':
    tu = 24*60*60
    print 'set format x "%d %H:%M"'
elif scale == 'weeks':
    tu = 7*24*60*60
    print 'set format x "%m/%d"'
elif scale == 'months':
    tu = 30*24*60*60
    print 'set format x "%m/%d/%y"'
elif scale == 'years':
    tu = 365*24*60*60
    print 'set format x "%m/%y"'
else:
    print 'set format x "%m/%d"'
if range_type == 'latest':
    time_end = now + offset_seconds
    time_start = time_end - duration*tu
elif range_type == 'start':
    time_start = now + offset_seconds + range_offset*tu
    time_end = time_start + duration*tu
elif range_type == 'end':
    time_end = now + offset_seconds + range_offset*tu
    time_start = time_end - duration*tu
else:
    sys.exit('bad range type')
print 'set xrange ["' + str(time_start) + '":"' + str(time_end) + '"]'

if logy_array.length > 0:
    print('set logscale y')

plotCommand =  'plot '
plot_array = plotConfig.getElementsByTagName('plot')
for j in range(plot_array.length): 
    plot_node = plot_array[j]
    xcolname = plot_node.getAttribute('x')
    ycolname = plot_node.getAttribute('y')
    xcol = position_dict[xcolname]
    ycol = position_dict[ycolname]
    scale = plot_node.getAttribute('scale')
    if scale == '':
        scale = '1.0'
    key = plot_node.getAttribute('key')
    if key == '':
        key = ycolname
    if xcolname == 'time':
        xcol = '(' + '$' + xcol + '+('+ str(offset_seconds) + '))'
    if j != 0:
        plotCommand += ','
    plotCommand += '\'' + data_file + '\' using ' + xcol + ':(' + scale + '*$' + ycol + ') title \'' + key + '\''
if not batch_mode:
    print plotCommand
    print 'pause -1 "Hit any key to continue"'
output_array = plotConfig.getElementsByTagName('output')
if output_array.length > 0:
    output_node = output_array[0]
    output_type = output_node.getAttribute('type')
    output_file = output_node.getAttribute('file')
    output_size = output_node.getAttribute('size')
    setTermCommand = 'set term ' + output_type
    if len(output_size) > 0:
        setTermCommand += ' size ' + output_size
    print setTermCommand
    print 'set output \'' + output_file + '\''
    print plotCommand
