#!/bin/bash
. /home/marki/bin/timer.sh
t0=$(timer)
mysql -hhallddb-farm -uccdb_user ccdb < query_multiple.sql > /dev/null
delta_t=$(timer -u seconds $t0)
echo $t0, $delta_t
