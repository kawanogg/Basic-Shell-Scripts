#!/bin/bash

echo "$(tput setaf 4) --------------------------------------------"
echo "|                                            |"
echo "|       		PORT SCANNER               |"
echo "|                                            |"
echo " --------------------------------------------$(tput setaf 7)"

if [ "$1" == "" ]
then
	echo "Necessary informations are missing."
	echo "Correct form: $0 <ip>"
else
	echo "$(tput setaf 1)######Port scanning...######$(tput setaf 7)"
	echo "$(tput setaf 2)Open ports:"
	for port in {20..65354};
	do
		sudo hping3 -S -p $port -c 1 $1 2> /dev/null | grep "SA" | cut -d "=" -f 6 | cut -d " " -f 1;
	done
	echo "$(tput setaf 1)########################################$(tput setaf 7)"
fi
