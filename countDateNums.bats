#!/usr/bin/env bats

#The countDateNums function outputs to standard output
#the number of digits in the output of the date command. 
#It also returns 0.
countDateNums() {
   #TODO
   #Hint: sed comes in handy
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

# test the function
@test "countDateNums" {
  #you can see what output it should produce by
  #running ./countDateNums
  correct="$(/u/css/classes/5521/241/lab1/countDateNums)" 
  run countDateNums
  #$output contains what was written to standard output by the function
  #$status contains what was returned by the function
  testhelper "$correct" "$output" "0" "$status"
}
