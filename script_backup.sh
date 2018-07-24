#!/bin/bash
if [ ! -d ~/respaldo ]; then 
	mkdir ~/respaldo 
fi
read -n1


read -n1

while [ `du ~/respaldo | cut -d '/' -f1 | tail -1` -gt 20 ] 
do
	echo `du ~/respaldo | cut -d '/' -f1 | tail -1`
	read -p "algo"
	cd ~/respaldo 	
	
	archivo="`ls -t | cut -d '/' -f 1 | tail -1`"
	
	echo "Archivo mas viejo es: '$archivo'"
    
	read -n1
    
	rm -R $archivo


	read -n1
done

fecha=`date +%Y%m%d%H%M%S`
usuario=`whoami`

tar -cvjf ~/respaldo/$fecha-$usuario-respaldo-home.tar ~/* 

