#!/usr/bin/bash
while true
do
sleep 5
SIZE=$(wc -c /var/www/tryhard.ddns.net/logs/newlog.log | awk '{print $1}')
if test -f /var/log/nginx/access.log && test -f /var/log/nginx/error.log
then
#if для проверки размера файла
if [ "$SIZE" -gt 5000 ]
then
echo ' ' > /var/www/tryhard.ddns.net/logs/newlog.log
date >> /var/www/tryhard.ddns.net/logs/timeclean.log
else
diff /var/log/nginx/access.log /var/www/tryhard.ddns.net/logs/tempaccess.log >> /var/www/tryhard.ddns.net/logs/newlog.log
cat /var/log/nginx/access.log > /var/www/tryhard.ddns.net/logs/tempaccess.log 
diff /var/log/nginx/error.log /var/www/tryhard.ddns.net/logs/temperror.log >> /var/www/tryhard.ddns.net/logs/newlog.log
cat /var/log/nginx/error.log > /var/www/tryhard.ddns.net/logs/temperror.log
awk '$10 <600 && $10 >499 {print $0}' /var/www/tryhard.ddns.net/logs/newlog.log >> /var/www/tryhard.ddns.net/logs/500.log
awk '$10 <500 && $10 >399 {print $0}' /var/www/tryhard.ddns.net/logs/newlog.log >> /var/www/tryhard.ddns.net/logs/400.log
fi
#конец if :)
fi
done
