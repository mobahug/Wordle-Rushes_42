#! /bin/bash

cat words_short.txt > temp.txt

printf "Start with a 5-letter word. You can also try: raise, roate or soare\n"

declare -i LENGTH
declare -i I=0


while [[ I -lt 6 ]]
do
	if [[ I -ne 0 ]]
	then
		while [[ "$ANSWER" != "yes" && "$ANSWER" != "no" ]]
		do
			printf "\x1B[0m Do you want to continue (\x1B[32m yes\x1B[0m /\x1B[31m no\x1B[0m )?\n"
			read ANSWER
			if [ "$ANSWER" == "yes" ]
			then
				ANSWER="-"
				break
			elif [ "$ANSWER" == "no" ]
			then
				rm temp.txt
				exit
			fi
		done
	fi
	printf "Enter all\x1B[90m grey\x1B[0m characters as one string:\n"
	read GREY;
	printf "Enter all\x1B[32m green\x1B[0m characters, in the correct order e.g.: (..c..) or (.....) if none were found:\n";
	read GREEN;
	printf "Enter all\x1B[33m yellow\x1B[0m characters, in the same structure as previous or (.....) if none were found:\n";
	read YELLOW;

	ARRAY=( `echo $GREY | grep -o . ` )
	LENGTH=$(echo "$GREY" | awk '{print length}')

	while [ $LENGTH -gt 0 ]
	do
    		LENGTH=$((LENGTH - 1))
    		awk !/"${ARRAY["$LENGTH"]}"/ temp.txt > check.txt
		rm temp.txt
		mv check.txt temp.txt
	done


	grep "$GREEN" temp.txt > check.txt
	rm temp.txt
	mv check.txt temp.txt


	LENGTH=$(echo "$YELLOW" | awk '{print length}')

	ARRAY=( `echo $YELLOW | grep -o . ` )
	if [ "$YELLOW" != "....." ]
	then
		while [ $LENGTH -gt 0 ]
		do
			LENGTH=$((LENGTH - 1))
			if [ ${ARRAY["$LENGTH"]} != "." ]
			then
				awk /"${ARRAY["$LENGTH"]}"/ temp.txt > check.txt
				rm temp.txt
				mv check.txt temp.txt
			fi
		done
		LENGTH=0
		STRING=""
		while [[ $LENGTH -lt 5 ]]
		do
			if [ "${ARRAY[$LENGTH]}" != "." ]
			then
				STRING+="[^"${ARRAY[$LENGTH]}"]"
			else
				STRING+="."
			fi
			LENGTH=$((LENGTH + 1))
		done
		awk /"$STRING"/ temp.txt > check.txt
		rm temp.txt
		mv check.txt temp.txt
	fi
	printf "CHOOSE FROM\n\n"
	cat temp.txt
	I=$((I + 1))
done
