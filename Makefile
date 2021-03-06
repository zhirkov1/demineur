#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jchichep <jchichep@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/03/25 08:20:56 by jchichep          #+#    #+#              #
#    Updated: 2014/03/25 08:35:30 by jchichep         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME	=	demineur

PWD	=	$(shell pwd)

SRCDIR	=	.

OBJDIR	=	.

ECHO	=	echo

SRC	=	basics.c \
		check_case.c \
		flag.c \
		level.c \
		main.c \
		menu.c \
		move_function.c \
		raw_mode.c \
		show_tab.c \
		start_game.c

NOM	=	$(basename $(notdir $(SRC)))

OBJ	=	$(addprefix $(OBJDIR)/, $(addsuffix .o, $(NOM)))

CFLAGS	+=	-Wall -Wextra -Werror -ansi -pedantic

LINK	=

$(OBJDIR)/%.o:	$(SRCDIR)/%.c
	@gcc -c $(CFLAGS) $(LINK) -o $@ $< \
	&& $(ECHO)  "\033[1;30m[CC] : Compiled $(notdir $<) [\033[0;32mOk\033[1;30m]\033[0m" \
	|| $(ECHO)  "\033[1;30m[CC] : Compiled $(notdir $<) [\033[0;5;31mError\033[0;1;30m]\033[0m"

$(NAME):	$(OBJ)
	@$(ECHO)  "\033[1;30m[CFLAGS] : $(CFLAGS)\033[0m"
	@$(ECHO)  "\033[1;30m[LINK] : $(LINK)\033[0m"
	@gcc $(OBJ) $(CFLAGS) $(LINK) -o $(NAME)
	@$(ECHO)  "\033[1;30m[LINKING] : $(basename $(notdir $(addsuffix .o, $(OBJ))))\033[0m"
	@$(ECHO)  " \033[0;31m.o0*0o.\033[0;1;31mCompilation DONE\033[0;31m.o0*0o.\033[0m"

all:		$(NAME)

clean:
	@rm -f *~ */*~ \#*\# */\#*\#
	@rm -f $(OBJ)
	@$(ECHO)  "\033[1;30m[RM] : erasing *~ and #*#\033[00m"
	@$(ECHO)  "\033[1;30m[RM] : erasing $(basename $(notdir $(addsuffix .o, $(OBJ))))\033[00m"
	@$(ECHO)  "    \033[0;33m.o0*0o.\033[0;1;33mClean DONE\033[0;33m.o0*0o.\033[00m"

fclean:		clean
	@rm -f $(NAME)
	@$(ECHO)  "\033[1;30m[RM] : erasing $(NAME)\033[00m"
	@$(ECHO)  "   \033[0;32m.o0*0o.\033[0;1;32mFclean DONE\033[0;32m.o0*0o.\033[00m"

re:		fclean all

bin:		all clean

allx:		$(NAME)
	@./$(NAME)

rex:		re
	@./$(NAME)

.PHONY:	all clean fclean re bin allx rex
