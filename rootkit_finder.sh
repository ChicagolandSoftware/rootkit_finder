#!/bin/bash
#must be run as root
divider() {
    echo "======================="
}

#to-do: use tee to log to a file
#to-do: check history of non-root users
#to-do: https://www.computerhope.com/unix/uat.htm
#to-do: fg and bg tasks
#for more to-dos, see the end of the script

echo -n "checking for rootkits on "
date
divider
echo "Part 1: environment"
divider
echo "PATH:"
echo $PATH
divider
echo "aliases:"
alias
divider
echo "Part 2: reading shell history"
divider
echo "history containing /etc/passwd:"
history | grep /etc/passwd
divider
echo "history containing /etc/shadow:"
history | grep /etc/shadow
divider
divider
echo "history containing bash (sometimes used for reverse shells):"
history | grep bash
divider
echo "history containing /dev/tcp/ (sometimes used for reverse shells):"
history | grep /dev/tcp/
divider
echo "history containing unset HISTFILE:"
history | grep 'unset HISTFILE'
divider
echo "history containing nc (used for bind shells or listeners):"
history | grep nc
divider
echo "history containing netcat:"
history | grep netcat
divider
echo "history containing dnscat (used for data exfiltration):"
history | grep dnscat
divider
echo "history containing mysql (such as connection attempts):"
history | grep mysql
divider
echo "history containing wget:"
history | grep wget
divider
echo "history containing curl:"
history | grep curl
divider
echo "history containing cron:"
history | grep cron
divider
echo "history containing systemctl:"
history | grep systemctl
divider
echo "Part 2: logins"
divider
echo "currently logged in users:"
w
divider
echo "last:"
last
divider
echo "lastlog:"
lastlog
divider
echo "current network connections (netstat -atu):"
netstat -atu
divider
echo "Part 3: checking scheduled tasks"
divider
echo "systemd timers:"
systemctl list-timers
divider
echo "/etc/crontab:"
cat /etc/crontab
divider
echo "non-root user crontabs:"
cat /var/spool/cron/crontabs/*
divider
echo "cron.daily"
#to-do: anacron
#to-do: cron.hourly
#to-do: cron.weekly
#to-do: cron.monthly
#to-do: at
#to-do: batch
#to-do: atq
#to-do: atrm
