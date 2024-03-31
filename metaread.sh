#!/bin/bash
echo "$(tput setaf 4) --------------------------------------------"
echo "|                                            |"
echo "|                  METAREAD                  |"
echo "|                                            |"
echo " --------------------------------------------$(tput setaf 7)"

if ["$1" == ""] 2>/dev/null || ["$2" == ""] 2> /dev/null
then
        echo "$(tput setaf 1)_______________________________________________________"
        echo "Supported files: pdf, doc, docx, xls, xlsx, ppt, pptx"
        echo "_______________________________________________________"
        echo "Usage method: ./metaread.sh <url> <file ext. type>"
        echo "_______________________________________________________$(tput setaf 7)"
else
	echo "This might take a few seconds..."
	lynx --dump "https://google.com/search?&q=site:$1+ext:$2" | grep ".$2" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > metaread
	for arq in $(cat metaread);
	do
		wget -q $arq;
	done

	exiftool *.$2

	rm *.$2
	rm metaread
fi
