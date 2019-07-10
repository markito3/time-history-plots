#!/bin/env python
import time
from xml.dom.minidom import parse
import xml.dom.minidom

now = time.time()

DOMTree = xml.dom.minidom.parse('free.xml')
compMod = DOMTree.documentElement
time_range = compMod.getElementsByTagName('time_range')
tr_element = time_range[0] # first one and first one only
duration = float(tr_element.getAttribute('duration'))
time_end = now
tu = 24*60*60
time_start = time_end - duration*tu

print 'set datafile separator ","'
print 'set xdata time'
print 'set timefmt "%s"'
print 'set xrange ["' + str(time_start) + '":"' + str(time_end) + '"]'
print 'set format x "%m/%d"'
print 'plot \'free.txt\' using 1:9'
print 'pause -1 "Hit any key to continue"'
