#!/bin/bash

for host in {1..254};
do
	knock $1.$host 13 37 30000 3000;
	echo $host
	sudo hping3 -S -p 1337 -c 1 $1.$host 2> /dev/null | grep "flags=SA";
done
