#!/usr/bin/env python
import mysql.connector
import time

now = time.time()

db = mysql.connector.connect(
  host="scidbw.jlab.org",
  user="dummy",
  passwd="",
  database="wdm"
)

data_line = str(now)

cursor = db.cursor()

cursor.execute('select reserved,quota,pin_quota,cached,taped,pinned,smallFile from projectDisk where root = "/cache/halld"')

result = cursor.fetchall()

line = result[0];
for x in line:
  data_line += ',' + str(x)

cursor.execute('select reserved,quota,cached,smallFile,fileCount from projectDisk where root = "/volatile/halld"')

result = cursor.fetchall()

line = result[0];
for x in line:
  data_line += ',' + str(x)

file_out = open("/group/halld/dplot_data/lustre.txt", "a+")
file_out.write("%s\n" % data_line)
file_out.close()
