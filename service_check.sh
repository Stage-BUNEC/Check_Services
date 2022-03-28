ACTIVE="active"

#verifier (){
#	etat=`systemctl is-active $1`
#	if [ "$etat" = "$ACTIVE" ]
#	then
#		echo "c'est bon"
#	else
#		echo "c'est pas bon"
#	fi
#}
#verifier $1 #appel de la fonction


for service in `cat services.txt`
do
	etat=`systemctl is-active $service`
	if [ "$etat" = "$ACTIVE" ]
	then
		echo "service : $service -> c'est bon"
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
			echo "Le service : $service a finalement demare"
		else
			echo "Le service : $service n'a pas demare au bout de $compte tentative"
		fi
	fi
done

