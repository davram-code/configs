#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9]{1,3}%')

# Full and short texts
[[ $(acpi -b | grep "Charging") ]] && echo -n "⚡"

echo "Battery: $BAT"
echo "BAT: $BAT"

# Set urgent flag below 5% or use orange below 20%

[ ${BAT%?} -gt 20 ] && echo "#FFD700"
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
