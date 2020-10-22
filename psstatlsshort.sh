#!/bin/bash

function list_short() {

	if [ -d "/proc" ]
	then
		echo "PID"

		#Checks each file in /proc folder
		for entry in "/proc"/*
		do

			#Checks if a valid PID
			if [[ ${entry:6} =~ ^[0-9]+$ ]]
			then
				#Prints each PID
				echo "${entry:6}"
			fi
		done

	else
		echo "Doesnt Exist"
	fi

}
