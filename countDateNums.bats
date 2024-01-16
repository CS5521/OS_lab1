#!/usr/bin/env bats

#The countDateNums function outputs to standard output
#the number of digits in the output of the date command. 
#It also returns 0.
countDateNums() {
   #TODO
   #Hint: sed comes in handy
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
