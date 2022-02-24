#! /bin/bash

cat words5.txt > temp.txt

uniqlist()
{
	perl -F -lane 'print do { my %seen; grep { !$seen{$_}++ } @F }' temp.txt > temp_uniq.txt
	grep -o -w '\w\{5,5\}' temp_uniq.txt > uniq.txt
	rm temp_uniq.txt
}

printf "Try starting with: raise\n"

declare -i LENGTH
declare -i I=0
declare -i BB
declare -i GG

while [[ I -lt 6 ]]
do
	if [[ I -ne 0 ]]
	then
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
				rm temp.txt
				rm uniq.txt
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
	if [[ I -gt -1 && I -lt 3 ]]
	then
		uniqlist
		GG=$(echo "$(( $RANDOM % $(awk 'END{print NR}' uniq.txt) + 1 ))")
		printf "Enter: $(awk NR==${GG} uniq.txt)\n"
	else
		GG=$(echo "$(( $RANDOM % $(awk 'END{print NR}' temp.txt) + 1 ))")
		printf "Enter: $(awk NR==${GG} temp.txt)\n"
	fi
	I=$((I + 1))
done
