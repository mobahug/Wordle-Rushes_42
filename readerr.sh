#!/bin/bash

filename='words5.txt'

i=1;
j=$#;

while read line;
do
	while [ $i -le $j ]
	do
		echo "$i";
		i=$((i + 1)):
		shift 1;
	done
# reading each line
echo "$line"
done < $filename