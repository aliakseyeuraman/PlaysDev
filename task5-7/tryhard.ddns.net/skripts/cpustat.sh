#!/usr/bin/bash
while true
do
sleep 1
#CPU=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
#echo $CPU > /var/www/tryhard.ddns.net/cpu.html
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%" > /var/www/tryhard.ddns.net/cpu.html
done
