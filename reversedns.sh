#!/bin/bash

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]
then
	echo "Usage method: ./reversedns.sh <network addr> <1st host> <last host>"
else
	
	for s in $(seq $2 $3);
	do
		host -t hinfo $1.$s;
	done
fi
