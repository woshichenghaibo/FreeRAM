#!/bin/sh
used=`free -m | awk 'NR==2' | awk '{print $3}'`
free=`free -m | awk 'NR==2' | awk '{print $4}'`
echo "===========================" >> /var/log/mem.log
date >> /var/log/mem.log
echo "Memory usage | [Use：${used}KB][Free：${free}KB]" >> /var/log/mem.log
if [ $free -le 153600 ] ; then
sync && echo 1 > /proc/sys/vm/drop_caches
sync && echo 2 > /proc/sys/vm/drop_caches
sync && echo 3 > /proc/sys/vm/drop_caches
echo "OK" >> /var/log/mem.log
else
echo "Not required" >> /var/log/mem.log
fi
