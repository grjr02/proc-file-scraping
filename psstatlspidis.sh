#!/bin/bash

function list_pid_is() {

  while read line
  do
    STAT=$line
  done </proc/$1/"stat"

  VAL=' ' read -r -a array<<<$STAT

  printf "%13s\t  %6s   \n" "pid:"         "${array[0]}"
  printf "%13s\t  %6s   \n" "comm:"        "${array[1]}"
  printf "%13s\t  %6s   \n" "state:"       "${array[2]}"
  printf "%13s\t  %6s   \n" "minflt:"      "${array[9]}"
  printf "%13s\t  %6s   \n" "majflt:"      "${array[11]}"
  printf "%13s\t  %6s %s\n" "utime:"       "${array[13]}" "clock ticks"
  printf "%13s\t  %6s %s\n" "stime:"       "${array[14]}" "clock ticks"
  printf "%13s    %7s   \n" "num_threads:" "${array[19]}"
  printf "%13s\t  %3s %s\n" "vsize:"       "${array[22]}" "bytes"
  printf "%13s\t  %6s %s\n" "rss:"         "${array[23]}" "pages"

}
