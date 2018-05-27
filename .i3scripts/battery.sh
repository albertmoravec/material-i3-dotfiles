#!/bin/sh

percent=`acpi -b | cut -d, -f2 | tr -d "[:blank:]"`
num=${percent%?}

if [ `acpi -b | grep Discharging` -z ]
then
	echo -en "\uf1e6"
else
	if [ $num -gt 90 ]
	then
		echo -en "\uf240"		
	elif [ $num -gt 75 ] 
	then
		echo -en "\uf241"
	elif [ $num -gt 50 ]
	then
		echo -en "\uf242"
	elif [ $num -gt 25 ]
	then
		echo -en "\uf243"
	else
		echo -en "\uf244"
	fi
fi

echo " $percent"

		
