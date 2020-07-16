#!/bin/bash
html_file=halld_status.html
title="Hall D Offline Computing Systems"
date=`date`
rm -f header.html
cat > header.html <<EOF
<html>
<head>
<title>$title</title>
</head>
<body>
<h1>$title</h1>
<h3>Time Histories, updated $date</h3>
<p>Click on thumbnails for full-size plots.</p>
<table border>
EOF
rm -f header_row.html
cat > header_row.html <<EOF
<tr><th>System</th><th>One Day</th><th>Two Weeks</th><th>Six Months</th><th>Five Years</th></tr>
EOF
make_eight.sh group_disk $THP/plots/df/group.thpml.template
make_eight.sh work_disk $THP/plots/df/work.thpml.template
make_eight.sh cache_disk $THP/plots/lustre/cache.thpml.template
make_eight.sh volatile_disk $THP/plots/lustre/volatile.thpml.template
make_eight.sh oasis_disk  $THP/plots/oasis/oasis.thpml.template
make_eight.sh farm_jobs $THP/plots/jobstat/jobstat.thpml.template
make_eight.sh user_jobs /group/halld/time_history_data/user_jobs.thpml.template
make_eight.sh mysql_servers $THP/plots/mysql/mysql.thpml.template
time=`date +%s`
rm -f end_table.html
cat > end_table.html <<EOF
</table>
<h3>b<sub>1</sub>&pi; Test</h3>
EOF
make_two.sh b1pi_test $THP/plots/b1pi_test/b1pi_test.thpml
rm -f footer.html
cat > footer.html <<EOF
<h3>Work Disk Server Load</h3>
<a href="https://lqcd.jlab.org/ganglia/?c=Disk%20Servers&h=scifs1701.jlab.org&m=load_one&r=hour&s=descending&hc=4&mc=2"><img src="https://lqcd.jlab.org/ganglia/graph.php?g=load_report&z=medium&c=Disk%20Servers&h=scifs1701.jlab.org&m=load_one&r=hour&s=descending&hc=4&mc=2&st$time"/></a>
</body>
</html>
EOF
rm -f $html_file
cat header.html header_row.html group_disk.html work_disk.html cache_disk.html volatile_disk.html header_row.html oasis_disk.html farm_jobs.html user_jobs.html mysql_servers.html end_table.html b1pi_test.html footer.html > $html_file
