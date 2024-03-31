#!/bin/bash

if [ "$1" == "" ]
then
	echo "Usage method: ./zonetransfer.sh <url>"
else
	for server in $(host -t ns $1 | cut -d " " -f 4);
	do
		 host -l $1 $server | egrep "name server|has address";
	done
fi
