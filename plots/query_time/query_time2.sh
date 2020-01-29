#!/bin/bash
. /home/marki/marki/timer2.sh
t0=$(timer2)
mysql -hhallddb-farm -uccdb_user ccdb < query_multiple.sql > /dev/null
delta_t=$(timer2 -u seconds $t0)
echo $t0, $delta_t
