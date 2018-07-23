#!/bin/bash
if [ ! -d ~/Escritorio/respaldo ]; then 
	mkdir ~/Escritorio/respaldo 
fi

size = "`du ~/Escritorio/Cisco | cut -d '/' -f 1 | tail -l`"

if [ $(($size)) -gt $(100000) ] then
  echo("Entro")
fi

while [ $(($size)) -gt $(100000) ]
do
	rm -Ri | ls -t | tail -1
done

#cp -Rpa  ~/Escritorio/Cisco ~/Escritorio/respaldo 




#!/bin/bash
if [ ! -d ~/Escritorio/respaldo ]; then 
	mkdir ~/Escritorio/respaldo 
fi

size="`du ~/Escritorio/Cisco | cut -d '/' -f1 | tail -1`"
echo $size
if [ $size -gt 100000 ] then
  echo("Entro")
fi


