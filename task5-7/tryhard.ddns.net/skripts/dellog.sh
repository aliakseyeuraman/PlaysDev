#!/usr/bin/bash
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/newlog.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/400.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/500.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/timeclean.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/temperror.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/tempaccess.log
sudo echo ' ' > /var/www/tryhard.ddns.net/logs/templog.log
sudo rm /var/log/nginx/access.log
sudo rm /var/log/nginx/error.log
sudo service nginx restart
