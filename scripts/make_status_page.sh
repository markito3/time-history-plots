#!/bin/bash
html_file=halld_status.html
title="this is the title"
rm -f header.html
cat > header.html <<EOF
<html>
<head>
<title>$title</title>
</head>
<body>
<h1>$title</h1>
<table border>
EOF
make_eight.sh cache $THP/plots/lustre/cache.dpml.template
rm -f footer.html
cat > footer.html <<EOF
</table>
</body>
</html>
EOF
rm -f $html_file
cat header.html cache.html footer.html > $html_file

