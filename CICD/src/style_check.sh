#!/bin/bash

if [ -f "style_output.txt" ];
then
	if [ -s "style_output.txt" ];
	then
		clang-format -n --style=Google *.c *.h
		exit 1
	else
		echo "Style test OK"
	fi
else
	echo "Missing file clang_output.txt \n Run style test first"
	exit 1
fi