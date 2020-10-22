#!/bin/bash
function help_and_exit() {
echo "Usage: psstat [OPTION] ..."
echo "List process information."
echo -e "Options are \n --list-short\t\tlist all processes in short format \n --list-long\t\tlist all processes in long format\n --list-name-has <name_part> list all processes whose name has name_part in long format "
echo -e " --list-pid-is <pid>\tlist status of the process whose pid is <pid>"
echo -e " --list-sched-policy-is <policy_number>  list all processes whose CPU scheduling policy number is <policy_number> in long format"

exit 1
}
