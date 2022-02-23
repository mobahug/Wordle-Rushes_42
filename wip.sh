#! /bin/bash

printf "suggested wrd\n"

printf "Enter all grey characters as one string:\n"
read GREY;
printf "Enter all green characters, in the correct order(eg ..c..):\n";
read GREEN;
#printf "Enter all yellow characters, in the same structure as previous:\n";
#read YELLOW;

ARRAY=( `echo $GREY | grep -o . ` )

declare -i LENGTH=$(echo "$GREY" | awk '{print length}')

ADD=" | !/"${ARRAY[1]}"/"
ARG="awk !/"${ARRAY[0]}"/ words5.txt"

cat words5.txt >> temp.txt

#awk !/"${ARRAY[0]}"/ words5.txt | awk !/"${ARRAY[1]}"/
#$ARG
while [ $LENGTH -gt 0 ]
do
    	LENGTH=$((LENGTH - 1))
    	#printf "$LENGTH"
    	awk !/"${ARRAY["$LENGTH"]}"/ temp.txt >> grey.txt
	rm temp.txt
	mv grey.txt temp.txt
done

grep "$GREEN" temp.txt >> green.txt

#	SOME IMPLEMENTATION OF:

#awk '/c/ && /l/ && !/[c]l.c./' green.txt
#		where [^] is from previous attempt


#awk !/"${ARRAY[0]}"/ words5.txt | awk !/"${ARRAY[1]}"/
