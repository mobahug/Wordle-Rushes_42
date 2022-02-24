#! /bin/bash

cat words5.txt > temp.txt

printf "Try starting with: RAISE, ROATE or SOARE\n"

declare -i LENGTH
declare -i I=0


while [[ I -lt 6 ]]
do
	if [[ I -ne 0 ]]
	then
		printf "checking\n"
		while [[ "$ANSWER" != "yes" && "$ANSWER" != "no" ]]
		do
			printf "Do you want to continue (yes/no)?\n"
			read ANSWER
			if [ "$ANSWER" == "yes" ]
			then
				ANSWER="-"
				break
			elif [ "$ANSWER" == "no" ]
			then
				exit
			fi
		done
	fi
	printf "Enter all grey characters as one string:\n"
	read GREY;
	printf "Enter all green characters, in the correct order(eg ..c..):\n";
	read GREEN;
	printf "Enter all yellow characters, in the same structure as previous or 5 '.' (.....) if empty:\n";
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
		grep -v "$YELLOW" temp.txt >> check.txt
		rm temp.txt
		mv check.txt temp.txt
	fi

	while [[ $LENGTH -gt 0 && "$YELLOW" != "....." ]]
	do
		LENGTH=$((LENGTH - 1))
		if [ ${ARRAY["$LENGTH"]} != "."  ]
		then
			awk /"${ARRAY["$LENGTH"]}"/ temp.txt > check.txt
			rm temp.txt
			mv check.txt temp.txt
		fi
	done
	printf "CHOOSE FROM\n\n"
	cat temp.txt
	I=$((I + 1))
done

