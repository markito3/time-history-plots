#!/bin/bash
cat <<EOF
<time_history_data>
  <input_data file="/group/halld/time_history_data/user_jobs.txt"/>
  <columns>
    <column name="time" position="1"/>
EOF
n=2
while read -r user
do
    let m=n+1
    cat <<EOF
    <column name="$user total" position="$n"/>
    <column name="$user running" position="$m"/>
EOF
    let n+=2
done < known_users.txt
cat <<EOF
  </columns>
</time_history_data>
EOF
