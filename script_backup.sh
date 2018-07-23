#!/bin/bash
if [ ! -d ~/Escritorio/respaldo ]; then 
	mkdir ~/Escritorio/respaldo 
fi
read -n1

size="`du ~/Escritorio/Cisco | cut -d '/' -f1 | tail -1`"
echo $size

read -n1

while [ $size -gt $150000 ] 
do
	cd ~/Escritorio/Cisco	
	
	archivo="`ls -t | cut -d '/' -f 1 | tail -1`"
	
	echo "Archivo mas viejo es: '$archivo'"
    
	read -n1
    
	rm -R -i $archivo

	size="`du ~/Escritorio/Cisco | cut -d '/' -f1 | tail -1`"
	echo $size

	read -n1
done
cp -Rpa  ~/Escritorio/Cisco ~/Escritorio/respaldo 

echo "Se hizo el respaldo en ~/Escritorio/respaldo"




#!/bin/bash
#if [ ! -d ~/Escritorio/respaldo ]; then 
#	mkdir ~/Escritorio/respaldo 
#fi

#size="`du ~/Escritorio/Cisco | cut -d '/' -f1 | tail -1`"
#echo $size
#if [ $size -gt 100000 ] then
#  echo("Entro")
#fi


