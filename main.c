/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   reader.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ghorvath <ghorvath@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/23 11:58:16 by ghorvath          #+#    #+#             */
/*   Updated: 2022/02/23 12:54:16 by ghorvath         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#define BUFF_SIZE 5
/*
int	reader(int fd, )
{
	char		buffer[BUFF_SIZE + 1];
	ssize_t		ret;

	ret = read(fd, &buffer, BUFF_SIZE);
	if (ret == -1 || ret == 0 || fd == -1)
		return (0);
	while (ret)
	{
		buffer[ret] = '\0';
		ret = read(fd, &buffer, BUFF_SIZE);
			return (0);
	}
	return (1);
}*/



int	main(int argc, char **argv)
{
	FILE*	ptr;
	char	ch;
	ptr = fopen(argv[1], "r");

	if (!ptr)
	{
		printf("file can't be opened \n");
	}
	while (!feof(ptr))
	{
		ch = fgetc(ptr);
		printf("%c", ch);
	}
	fclose(ptr);
	return 0;
}