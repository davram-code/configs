#!/bin/bash

# Script printing the current ip for ethernet/wifi adapter

intf=""
case $1 in
    "ethernet")
    intf=$(ip a | egrep "^[1-9]: enp"| cut -f2 -d" " |cut -f1 -d:)
    ;;
    "wifi")
    intf=$(ip a | egrep "^[1-9]: w"| cut -f2 -d" " |cut -f1 -d:)
    ;;
esac

if [[ ${#intf} -gt 0 ]]
then
    output=$(ip a show $intf| egrep "inet (([0-9]{1,3}\.){3}[0-9]{1,3})" | tr -s " " | cut -f3 -d" ")

    if [[ $1 == "wifi" ]]
    then
        ssid=$(iwgetid -r)
        if [[ ! -z $ssid ]]
        then
            output=$output" ($ssid)"
        fi
    fi

    if [[ ${#output} -gt 0 ]]
    then
        echo $output
    else
        echo "No IP!"
        echo ""
        echo "#FF0000"
    fi
else
    echo "No such interface!"
fi
