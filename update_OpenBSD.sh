#!/bin/bash

echo "-----------------------------"

first=`uptime | cut -d"," -f 1`
if [[ $first == *mins  ]];
then
        nowt=`uptime | cut -d" " -f 5`
        echo "Uptime: " $nowt "minutes"
else
        nown=`uptime | cut -d" " -f 6`
        nowh=`echo $nown | awk -F":" '{ print $1}'`
        nowm=`echo $nown | awk -F":" '{ print $2}'`
        nowm=`echo $nowm | cut -b 1-2`
        echo "Uptime: " $nowh "hours, " $nowm "minutes"
fi

last reboot >> last_list

while read line; do
    if [[ $line = "" ]];
    then
        break
    fi

    dd=`echo $line | cut -d" " -f 5`
    temp=`echo $line | cut -d" " -f 6`
    hh=`echo $temp | cut -b 1-2`
    mm=`echo $temp | cut -b 4-5`
    echo "Uptime: " $dd "days, " $hh "hours, " $mm "minutes"
done < last_list

echo "-----------------------------"
rm -f last_list