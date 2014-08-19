#!/bin/bash
# Thursday 06/12/2012
# Author : Hayssam Noweir
# Description: Displays number of ip visits per seconds/minutes/hours

NGINX_LOG_PATH="/var/log/nginx/access.log"
MAX_VISITS=50

while [ 1 ]
do

	if [ `echo $2|grep "^[0-9]\{1,\}$"$2` !="" ]
	then
		MAX_VISITS=$2
	fi

	if [ "$1" = "-s" ]
	then
		DATE="`date +%d/%b/%Y:%k:%M:%S`"
	elif [ "$1" = "-m" ]
	then
		DATE="`date +%d/%b/%Y:%k:%M`"
	elif [ "$1" = "-h" ]
	then
		DATE="`date +%d/%b/%Y:%k`"
	else
		echo "Usage : $0 -h|-m|-s [max_to_show]" 
		exit
	fi

	clear
	echo
	echo -e "Time : $DATE\n"
	grep "$DATE" $NGINX_LOG_PATH| cut -d" " -f1 |sort -n |uniq -c |sort -nr  |awk -v mvisits=$MAX_VISITS 'BEGIN { SUM=0;print "#of visits\t\tIP"} {if ($1>=mvisits) print "\t"$1"\t\t" $2 ; SUM=SUM+$1} END{print "Total : \t" SUM} '
	echo
sleep 1
done
