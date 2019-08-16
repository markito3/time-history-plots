#!/usr/bin/env python
import mysql.connector

db = mysql.connector.connect(
  host="scidbw.jlab.org",
  user="dummy",
  passwd="",
  database="wdm"
)

cursor = db.cursor()

cursor.execute('select reserved,quota,pin_quota,cached,taped,pinned,smallFile from projectDisk where root = "/cache/halld"')

result = cursor.fetchall()

line = result[0];
for x in line:
  print(x)

cursor.execute('select reserved,quota,cached,smallFile,fileCount from projectDisk where root = "/volatile/halld"')

result = cursor.fetchall()

line = result[0];
for x in line:
  print(x)


#select sum(size)/1024/1024/1024/1024 from file,directory where file.dir_index = directory.dir_index and full_path like "/cache/halld/%" and file.owner != 'halldata' and file.owner != 'jasmine' and isCached = 1;
