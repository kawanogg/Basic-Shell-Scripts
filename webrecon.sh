#!/bin/bash
source colors

echo -e "${BOLD}"
echo -e "${LIGHTRED}----------------------------------------------------"
echo -e "#              ${LIGHTYELLOW} WEB RECON - By Kawano              ${LIGHTRED}#"
echo -e "${LIGHTRED}----------------------------------------------------"


if [ "$1" == "" ] || [ "$2" == "" ]
then
	echo -e "${LIGHTRED}----------------------------------------------------"
	echo -e "${LIGHTRED}#${LIGHTYELLOW}  Usage method: ./webrecon.sh <url> <file type>   ${LIGHTRED}#"
        echo -e "----------------------------------------------------"
else
        echo -e "${BLINK}${LIGHTRED}----------------------------------------------------${NORMAL}"
	echo -e "${BLUE}Searching for directories and archives..."
        echo -e "${BLINK}${LIGHTRED}----------------------------------------------------${NORMAL}"

	for word in $(cat lista2.txt);
	do
		resp=$(curl -s -H "User-Agent:KTool" -o /dev/null -w "%{http_code}" $1/$word/)
		if [ "$resp" == "200" ]
		then
			echo -e "${LIGHTGREEN}Directory found: ${LIGHTYELLOW}$1/$word/"
		fi
	done
        echo -e "${BLINK}${LIGHTRED}----------------------------------------------------${NORMAL}${BLUE}"

	for word in $(cat lista2.txt);
	do
		rarq=$(curl -s -H "User-Agent:KTool" -o /dev/null -w "%{http_code}" $1/$word.$2)
                if [ "$rarq" == "200" ]
                then
			echo -e "${LIGHTGREEN}$2 archive found: ${LIGHTYELLOW}$1/$word.$2"
                fi
	done
	echo -e "${BLINK}${LIGHTRED}----------------------------------------------------${NORMAL}${WHITE}"
fi
