NAME=		packer

###### SOURCES #######

SRC_NAME =	main.c\
		packer.c
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

#######  LIBS  ########

LIB_NAME =	haflib.a
LIB_DIR =	./haflib/
LIB_HEADER =	./haflib/includes/
LIB =		${addprefix $(LIB_DIR), $(LIB_NAME)}

#######  MISC  ########

FLAGS =		-Wall -Werror -Wextra -g
DEBUG_FLAGS =	$(FLAGS) -O0 -fsanitize=address
CC =		gcc

#################################################################################
##################################### RULES #####################################
#################################################################################

.PHONY: all clean fclean re lre
.SILENT:

########## GENERALS ##########

all: $(LIB) $(OBJ_DIR) $(NAME) $(HEADER)

re: fclean all

lre:
	rm -r $(OBJ_DIR)
	make all

clean:
	rm -rf $(OBJ_DIR)
	make clean -C $(LIB_DIR)

fclean:
	make fclean -C $(LIB_DIR)
	rm -rf $(OBJ_DIR) $(NAME) *.dSYM
	echo "\033[31m\033[1m\033[4mCleaning\033[0m\033[31m : Everything\033[0m [$(NAME)]";

debug:
	rm -r $(OBJ_DIR)
	make $(NAME)_debug

######### COMPILATION #########

$(NAME): $(OBJ)
	$(CC) $(FLAGS) $(OBJ) $(LIB) -o $(NAME) -I$(HEADER_DIR) -I$(LIB_DIR)
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)] --> $(LIB_NAME)"
	make header_print

$(NAME)_debug: ./auteur $(LIB) $(OBJ_DIR) $(HEADER) $(OBJ)
	$(CC) $(DEBUG_FLAGS) $(OBJ) $(LIB) -o $(NAME) -I$(HEADER_DIR) -I$(LIB_DIR)
	echo "\n \033[1m\033[4m\033[35m\\^/ Done compiling \\^/\033[0m [$(NAME)] --> $(LIB_NAME)"
	make header_print

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADER)
	$(CC) $(FLAGS) -c $< -o $@ -I$(HEADER_DIR) -I$(LIB_HEADER)
	printf "\033[32m\033[1m\033[4mCompiling\033[0m\033[32m : %-30s \033[0m [$(NAME)]\n" $@

$(OBJ_DIR): $(ALL_OBJ_DIR)
	mkdir -p $(OBJ_DIR)

$(ALL_OBJ_DIR):
	mkdir -p $@
	echo "\033[32m\033[1m\033[4mCreated\033[0m\033[32m : $@ obj dir\033[0m"

print_header:
	echo done

############# LIB #############

$(LIB):
	make -C $(LIB_DIR)
