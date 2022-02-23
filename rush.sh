# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    rush.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: altikka <altikka@student.hive.fi>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/23 18:23:16 by altikka           #+#    #+#              #
#    Updated: 2022/02/23 18:23:51 by altikka          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#! /bin/bash

printf "suggested wrd\n"

printf "Enter all grey characters as one string:\n"
read GREY;
#printf "Enter all green characters, in the correct order(eg ..c..):\n";
#printf "Enter all yellow characters, in the same structure as previous:\n";
#read YELLOW;

ARRAY=( `echo $GREY | grep -o . ` )

declare -i LENGTH=$(echo "$GREY" | awk '{print length}')

ADD=" | !/"${ARRAY[1]}"/"
ARG="awk !/"${ARRAY[0]}"/ words5.txt"


#awk !/"${ARRAY[0]}"/ words5.txt | awk !/"${ARRAY[1]}"/
#$ARG
while [ $LENGTH -gt 0 ]
do
    LENGTH=$((LENGTH - 1))
    #printf "$LENGTH"
    awk !/"${ARRAY["$LENGTH"]}"/ words5.txt >> temp.txt
done
#awk !/"${ARRAY[0]}"/ words5.txt | awk !/"${ARRAY[1]}"/
