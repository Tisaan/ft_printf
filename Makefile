# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tseche <tseche@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/13 23:39:11 by tseche            #+#    #+#              #
#    Updated: 2025/11/14 14:33:02 by tseche           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# --- Colors ---
RED    := \033[0;31m
GREEN  := \033[0;32m
YELLOW := \033[0;33m
BLUE   := \033[0;34m
PURPLE := \033[0;35m
CYAN   := \033[0;36m
NC     := \033[0m # No Color


NAME = libftprintf.a
CFLAGS = -Wall -Werror -Wextra 
CC	= cc
HEADER = ft_printf.h
SRCS =	ft_printf.c \
		ft_printf_algo.c \

LIBFT = ./libft/libft.a

OBJS = $(SRCS:%.c=%.o)

all: $(LIBFT) $(NAME)

$(LIBFT):
	@make -C ./libft --no-print-directory

$(NAME): $(OBJS)
	@echo "$(BLUE)🔗 Creating library $@...$(NC)"
	@cp $(LIBFT) $(NAME)
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)✅ Created $@$(NC)"
	
%.o : %.c $(HEADER)
	@$(CC) $(CFLAGS) -I. -ILIBFT -c $< -o $@
	
clean:
	@echo "$(RED)🧹 Cleaning...$(NC)"
	@rm -rf $(OBJS)
	@make -C ./libft clean --no-print-directory

libclean:
	@echo "$(RED)🧹 Cleaning lib_ft...$(NC)"
	@make -C ./libft clean --no-print-directory

fclean:  clean libclean
	@echo "$(RED)🗑️ Removing library $(NAME)...$(NC)"
	@rm -rf $(NAME)
	@make -C ./libft fclean --no-print-directory

re: fclean all

help:
	@echo "$(PURPLE)=== Makefile Help ===$(NC)"
	@echo "$(PURPLE)all:$(NC) Build the library"
	@echo "$(PURPLE)clean:$(NC) Remove object files"
	@echo "$(PURPLE)fclean:$(NC) Remove object files and library"
	@echo "$(PURPLE)re:$(NC) Rebuild the library from scratch"
	@echo "$(PURPLE)help:$(NC) Show this help message"

.PHONY: re all clean help

