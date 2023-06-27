#!/bin/bash

temps=$(sensors | grep Core | tr -s " " | cut -f3 -d " ")

max=0
for i in $temps
do
    temp=${i%.[0-9]*}
    temp=${temp/+}

    if [[ $temp -gt $max ]]
    then 
        max=$temp
    fi

done

echo "CPU:  $temp °C"

echo "#00FF00"

if [[ $temp -gt 75 ]]
then
    echo "#FF0000"
else
    echo "#0F52BA"
fi

