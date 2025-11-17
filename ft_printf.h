/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tseche <tseche@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/19 12:39:44 by tseche            #+#    #+#             */
/*   Updated: 2025/10/22 07:56:48 by tseche           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <unistd.h>
# include <stdint.h>
# include "libft/libft.h"

int		ft_putlnbr_fd(int nbr, int fd);
int		ft_putnbrbase_fd(size_t nbr, char *set, size_t size);
int		ft_convertptr(void *p);
int		ft_putlstr_fd(char *s, int fd);
int		ft_printf(const char *s, ...);
int		ft_countdigitsbase(size_t n, size_t size_set);
int		ft_putlchar(char c);
int		conversionnbr(char c, va_list args);

#endif