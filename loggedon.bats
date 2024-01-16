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

# $1 is expected output; $2 is actual output; 
# $3 is expected status; $4 is actual status
testhelper() {
  if [ "$1" != "$2" ]; then
    echo "ERROR: expected output is $1, actual output is $2"
  fi
  [ "$1" = "$2" ]
  if [ "$3" != "$4" ]; then
    echo "ERROR: expected status is $3, actual status is $4"
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
