#!/bin/bash

var1="1"
var2="2"

echo "var1 is $var1"
echo "var2 is $var2"

# conditionals
if [[ $var1 -gt $var2 ]]; 
then
	echo "$var1 is greater than $var2"
elif [[ $var1 -eq $var2 ]]; 
then
	echo "Variables are equal"
else 
	echo "$var1 is smaller than $var2"
fi


str1="Ioana"
str2="Ioana"

if [[ $str1 == $str2 ]]; 
then
	echo "Similar strings"
fi

if [[ $var1 -gt 0 ]] && [[ $var1 -lt $var2 ]]; 
then
	echo "$var1 > 0 and $var1 < $var2"
fi


# loops
for i in `seq 1 5`; 
do
	echo item: $i
done

# arguments parsing
echo $@

echo $1 $3

# input and output
echo "First lab" > lab1.txt
echo "Fun fact" >> lab1.txt


while read line;
do
	echo $line
done < lab1.txt

#named pipe
grep "First" lab1.txt | wc -l


