#!/usr/bin/env bats

#The loggedon function displays the number of users that are 
#currently logged on. This output is sent to standard output.
#It also returns 0.
loggedon() {
   #TODO
   #Be careful that some of the users may 
   #be logged on more than once but only should be counted once.
   #To see what the the output of your script should be run: 
   # /u/css/classes/5521/241/lab1/loggedon
   #
   #Hint: awk can be useful for this one, as well as several other commmands
   #piped together
   return 0   
}

# $1 is correct output; $2 is your output; 
# $3 is correct status; $4 is your status
testhelper() {
  if [ "$1" != "$2" ]; then
    echo "ERROR: correct output is |$1|, your output is |$2|"
  fi
  [ "$1" = "$2" ]
  if [ "$3" != "$4" ]; then
    echo "ERROR: correct status is $3, your status is $4"
  fi
  [ "$3" = "$4" ]
}

#test the loggedon function
@test "loggedon" {
  #run the C program to get the correct output
  correct="$(/u/css/classes/5521/241/lab1/loggedon)" 
  run loggedon
  testhelper "$correct" "$output" "0" "$status"
}
