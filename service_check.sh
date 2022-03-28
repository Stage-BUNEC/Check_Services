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

if [ `systemctl is-active $1` = "$ACTIVE" ]
then
	echo "c'est bon"
else
	echo "c'est pas bon"
fi
