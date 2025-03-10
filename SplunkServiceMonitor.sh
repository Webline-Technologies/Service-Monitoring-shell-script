#!/bin/bash

###edit the following
export smtp=server.webline.co.tz:25
service=lsws
email=josephhelela@gmail.com.com
###You can provide multiple mail ID's above in email variable separated by commas
###stop editing

host=`hostname -f`
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 2 ))
then
echo "$service is running"
else
/usr/local/lsws/bin/lswsctrl restart
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 2 ))
then
subject="$service at $host has been started"
echo "$service at $host wasn't running and has been started" | mailx -s "$subject" $email
else
subject="$service at $host is not running"
echo "$service at $host is stopped and cannot be started!!!" | mailx -s "$subject" $email
fi
fi

