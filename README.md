nginx_ips_visit
===============

Displays number of requests made by ips per seconds/minutes/hours from nginx webserver logs

How to use ?

chmod +x nginx_ips_visit.sh

Usage : ./nginx_ips_visit.sh -h|-m|-s [max_to_show]

To Display the number of requests for ips in last 2 hours
./nginx_ips_visit.sh -h 2


To Display the number of requests for ips in last 5 minutes
./nginx_ips_visit.sh -m 5

To Display the number of requests for ips in last 10 seconds
./nginx_ips_visit.sh -s 10
