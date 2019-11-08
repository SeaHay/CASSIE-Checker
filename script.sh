#!/bin/bash

readVar=""
word=""
term=0
alnum='[[:alnum:]]'

while [ $term -eq 0 ]; do

	clear

	echo "Type '!' to erase the last letter"
	echo "Type '#' to end the program."
	echo "Type '%' to end with your typed word printed"; echo  
	if [ -n "$word" ]; then
		grep -o "\<${word}[A-Z0-9]*\>" list | tr "\n" " " > .temp
		printf "\n" >> .temp
		cat .temp | column -t
		rm .temp
	fi
	printf "\n$word"; read -rn1 readVar
	if [ "$readVar" = "#" -o "$readVar" = "%" ]; then
		term=1
	elif [ "$readVar" = "!" ]; then
		word=${word:0:$(( ${#word} - 1 ))}
	else
		if [[ $readVar =~ $alnum ]]; then
			readVar=${readVar^^}
			word=$word$readVar
		fi
	fi
done

clear
echo  
echo  
if [ "$readVar" = "%" ]; then
	echo $word
	echo  
	echo  
else
	echo  
	echo  
	echo  
fi
exit 0
