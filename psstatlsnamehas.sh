#!/bin/bash

function list_name_has() {

	if [ -d "/proc" ]
	then
		echo "PID CMD ST CMD_ARGS"
		#Checks each file in /proc folder
		for entry in "/proc"/*
		do
			#Checks if a valid PID
			if [[ ${entry:6} =~ ^[0-9]+$ ]]
			then
			#Checks if given arg is within comm folder
			if grep -q $1 $entry/"comm"
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
				CMD=$(tr -d '\0' <$entry/"cmdline")
				#Prints it to console
				echo ${entry:6} $COMM $STAT $CMD
			fi
		fi
	done
else
	echo "Doesnt Exist"
fi
}
