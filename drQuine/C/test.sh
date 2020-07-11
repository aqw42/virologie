#! /bin/sh

### COMPILATION ###

make re
echo
echo

### COLLEEN ###

./Colleen > Colleen_output
TEST_COLLEEN=`diff Colleen.c Colleen_output`
if [ -n "$TEST_COLLEEN" ]
then
	echo "\033[32mC O L L E E N  T E S T\033[0m [ \033[31mF A I L U R E\033[0m ]"
	echo $TEST_COLLEEN
	echo
else
	echo "\033[32mC O L L E E N  T E S T\033[0m [ \033[32mS U C C E S S\033[0m ]"
fi
rm Colleen_output

### GRACE ###

./Grace
TEST_GRACE=`diff Grace.c Grace_kid.c`
if [ -n "$TEST_GRACE" ]
then
	echo "\033[32mG R A C E  T E S T\033[0m     [ \033[31mF A I L U R E\033[0m ]"
	echo $TEST_GRACE
	echo
else
	echo "\033[33mG R A C E  T E S T\033[0m     [ \033[32mS U C C E S S\033[0m ]"
fi

echo "\033[34mS U L L Y  T E S T\033[0m"
./Sully
if [ `ls Sully_* | wc -w` -ne 5 ]
then
	echo "\033[31mWrong binary number\033[0m"
fi
diff Sully.c Sully_4.c | tail -n 1
diff Sully.c Sully_3.c | tail -n 1
diff Sully.c Sully_2.c | tail -n 1
diff Sully.c Sully_1.c | tail -n 1
diff Sully.c Sully_0.c | tail -n 1

make clean