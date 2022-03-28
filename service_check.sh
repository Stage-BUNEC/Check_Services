ACTIVE="active"

printMessage ()
{
	echo "` date '+%A_%D %X'`,$1,$2"
}

for service in `cat $1`
do
	etat=`systemctl is-active $service`
	if [ "$etat" = "$ACTIVE" ]
	then
		printMessage $service $etat
	else
		compte=0
		while [ "$compte" -lt 4 ] && [ "$etat" != "$ACTIVE" ]
		do
			`systemctl start $service 2> /dev/null`
			etat=`systemctl is-active $service`
			compte=$(( compte + 1 ))
			sleep 5
		done
		if [ "$etat" = "$ACTIVE" ]
		then
			printMessage $service $etat
		else
			printMessage $service $etat
		fi
	fi
done

