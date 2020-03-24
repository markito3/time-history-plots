#!/bin/bash
thp_home=/group/halld/Software/time-history-plots
thp_data=/group/halld/time_history_data
thp_web=/group/halld/www/halldweb/html/disk_management
export THP=$thp_home
export PATH=$thp_home/plots/jobstat:$thp_home/scripts:$PATH
cd $thp_data
make_user_thpml.py > user_jobs.thpml.template.tmp
mv user_jobs.thpml.template.tmp user_jobs.thpml.template
cd $thp_web
make_status_page.sh
