#!/bin/bash

echo "$(tput setaf 4) --------------------------------------------"
echo "|                                            |"
echo "|       		HTML PARSER                |"
echo "|                                            |"
echo " --------------------------------------------$(tput setaf 7)"

if [ "$1" == "" ]
then
	echo "	Website's url is missing"
	echo "	Correct form: $0 <URL>"
else
	echo "	$(tput setaf 1)#######################"
	echo "	|   Finding Hosts...  |"
	echo "	#######################$(tput setaf 7)"

	wget -q $1
	grep href index.html | cut -d '"' -f2 | grep "http" | cut -d "/" -f3 | uniq -u | tee hostList.txt
	rm index.html

        echo "	$(tput setaf 1)#######################"
        echo "	|  Resolving Hosts... |"
        echo "	#######################$(tput setaf 7)"

	for url in $(cat hostList.txt);
	do
		host $url | grep -v "not found" | grep "has address"
	done

	rm hostList.txt
fi


