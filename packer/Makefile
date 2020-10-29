NAME=		packer

###### SOURCES #######

SRC_NAME =	main.c\
			packer.c\
			elf64.c
SRC_DIR =	./src/
SRC =		${addprefix $(SRC_DIR), $(SRC_NAME)}

#objects
OBJ_NAME =	$(SRC_NAME:.c=.o)
OBJ_DIR =	./obj/
OBJ =		${addprefix $(OBJ_DIR), $(OBJ_NAME)}

###### HEADERS ########

HEADER_DIR =	./inc/
HEADER_NAME =	packer.h
HEADER =	${addprefix $(HEADER_DIR), $(HEADER_NAME)}

#######  MISC  ########

FLAGS =		-Wall -Werror -Wextra -ansi -pedantic -g3
DEBUG_FLAGS =	$(FLAGS) -O0 -fsanitize=address
CC =		gcc

#################################################################################
##################################### RULES #####################################
#################################################################################

.PHONY: all clean fclean re lre
.SILENT:

########## GENERALS ##########

all: $(OBJ_DIR) $(NAME) $(HEADER)

re: fclean all

lre:
	rm -r $(OBJ_DIR)
	make all

clean:
	rm -rf $(OBJ_DIR)

fclean:
	rm -rf $(OBJ_DIR) $(NAME) *.dSYM
	echo "\033[31m\033[1m\033[4mCleaning\033[0m\033[31m : Everything\033[0m [$(NAME)]";

debug:
	rm -r $(OBJ_DIR)
	make $(NAME)_debug

######### COMPILATION #########

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) -o $(NAME) -I$(HEADER_DIR)
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)]"
	make header_print

$(NAME)_debug: $(OBJ_DIR) $(HEADER) $(OBJ)
	$(CC) $(DEBUG_FLAGS) $(OBJ) -o $(NAME) -I$(HEADER_DIR)
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)]"
	make header_print

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -I$(HEADER_DIR)
	printf "\033[32m\033[1m\033[4mCompiling\033[0m\033[32m : %-30s \033[0m [$(NAME)]\n" $@

$(OBJ_DIR): $(ALL_OBJ_DIR)
	mkdir -p $(OBJ_DIR)

$(ALL_OBJ_DIR):
	mkdir -p $@
	echo "\033[32m\033[1m\033[4mCreated\033[0m\033[32m : $@ obj dir\033[0m"

header_print:
	echo done

