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
	if [ `systemctl is-active $service` = "$ACTIVE" ]
	then
		echo "service : $service -> c'est bon"
	else
		echo "service : $service -> c'est pas bon"
	fi
done
