#!/bin/bash

function list_long() {

	if [ -d "/proc" ]
	then
		echo "PID CMD ST CMD_ARGS"

		#Checks each file in /proc folder
		for entry in "/proc"/*
		do
			#Checks if a valid PID
			if [[ ${entry:6} =~ ^[0-9]+$ ]]
			then
			#Gets value from comm folder
			while read line
			do
				COMM=$line
			done <$entry/"comm"

			#Gets and parses needed value from stat folder
			while read line
			do
				STAT=$line
				STAT="${STAT#*)}"
				STAT="${STAT:0:2}"
			done <$entry/"stat"

			#Gets value from cmdline folder
			CMD=$(tr -d '\0' <$entry/cmdline)

			#Prints values to console(4 columns)
			echo ${entry:6} $COMM $STAT $CMD
		fi
	done

else
	echo "Doesnt Exist"
fi
}
