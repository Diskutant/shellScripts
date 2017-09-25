#!/bin/sh
#APIKEY=""
#IDEN=""
DISABLEDNOTIFICATIONIP="NONEIP"
 

tail -F /var/log/auth.log | gawk -v APIKEY=$APIKEY -v IDEN=$IDEN -v DISABLEDNOTIFICATIONIP=$DISABLEDNOTIFICATIONIP '{ if(NR>10 && $0 ~ /sshd/ && ( $0 ~ /Accepted/ || $0 ~ /Failed/ ) && $0 !~ /'"$DISABLEDNOTIFICATIONIP"'/) { cmd=sprintf("curl -s https://api.pushbullet.com/api/pushes -u " APIKEY ": -d device_iden=" IDEN " -d type=note -d title=\"piServer: ssh %s %s - %s\" -d body=\"User %s %s from %s\n\n%s\" -X POST", $6, $9, $11, $9, $6, $11, $0); system(cmd) } }'
