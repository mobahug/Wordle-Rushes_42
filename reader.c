/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   reader.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ghorvath <ghorvath@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/23 12:55:50 by ghorvath          #+#    #+#             */
/*   Updated: 2022/02/23 12:56:04 by ghorvath         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void	error(char *str)
{
	ft_putendl(str);
	exit (EXIT_FAILURE);
}

int	main(int argc, char **argv)
{
	int			fd;
	int			count;
	int			size;
	t_tetri		tetri[27];
	uint16_t	map[16];

	if (argc != 2)
		error("usage: ./fillit file.fillit");
	fd = open(argv[1], O_RDONLY);
	count = 0;
	if (!reader(fd, tetri, &count))
		error("error");
	tetri[count].code = 0;
	size = solve(tetri, count, map);
	print_board(tetri, size);
	close(fd);
	return (0);
}