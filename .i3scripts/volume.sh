alsa=`amixer sget Master | grep 'Right:'`
state=`echo "$alsa" | awk -F'[][]' '{ print $4 }'`
vol=`echo "$alsa" | awk -F'[][]' ' { print $2 }'`

if [ "$state" = "on" ]
then
	if [ "${vol%?}" -eq 0 ]
	then
		echo -en "\uf026"
	elif [ "${vol%?}" -lt 50 ]
	then
		echo -en "\uf027"
	else
		echo -en "\uf028"
	fi
else
	echo -en "\uf026"
fi

echo " $vol"
