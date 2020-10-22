#!/bin/bash


function list_sched_policy_is(){
	declare -a ARRAY
	ARRAY=($(ls /proc/ | grep '^[0-9]*$' ))
	for element in "${ARRAY[@]}";
	do
		pids="$element"
		if [[ -d /proc/$pids ]];
		then
			policy=$(cat /proc/$pids/stat | awk '{print $41}')
			if [[ $policy == $1 ]];
			then

				case "$policy" in
					"0")
					Sched="SCHED_NORMAL(0)"
					;;
					"1")
					Sched="SCHED_FIFO(1)"
					;;
					"2")
					Sched="SCHED_RR(2)"
					;;
					"3")
					Sched="SCHED_BATCH(3)"
					;;
					*) ;;
				esac
				printf "%13s\t %6s \n" "pid:" "$(cat /proc/$pids/stat | awk '{print $1}')"
				printf "%13s\t %6s \n" "cmd:" "$(cat /proc/$pids/comm)"
				printf "%13s\t %6s \n" "state:" "$(cat /proc/$pids/stat | awk '{print $3}')"
				printf "%13s\t %6s \n" "sched_policy:" "$Sched"
				if [[ 0 ==  $1 ]];
				then
					printf "%13s\t %6s \n\n" "cmd_args:" "$(cat /proc/$pids/cmdline | sed -e "s/\x00/ /g")"
				else
					printf "%13s\t %6s \n\n" "" ""
				fi
			fi
		fi
	done
}
