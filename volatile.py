#!/usr/bin/env python
import mysql.connector

db = mysql.connector.connect(
  host="scidbw.jlab.org",
  user="dummy",
  passwd="",
  database="wdm"
)

cursor = db.cursor()

cursor.execute('select sum(size)/1024.0/1024.0/1024.0/1024.0 from vfile where grp like "halld%"')

myresult = mycursor.fetchall()

for x in myresult:
  print(x)


#select sum(size)/1024/1024/1024/1024 from file,directory where file.dir_index = directory.dir_index and full_path like "/cache/halld/%" and file.owner != 'halldata' and file.owner != 'jasmine' and isCached = 1;
