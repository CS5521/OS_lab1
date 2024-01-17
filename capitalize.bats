#!/usr/bin/env bats
#
#The capitalize function capitalizes every vowel character of 
#its single argument and sends that output to
#standard output. If no argument is provided,
#it returns a status of 1. Otherwise, it returns a status
#of 0.
capitalize() {
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


@test "capitalize hi there" {
  #quotes here make it a single argument instead of two
  run capitalize 'hi there' 
  correct='hI thErE'
  #$output contains what was written to standard out by capitalize
  #$status contains what was returned by capitalize
  testhelper "$correct" "$output" "0" "$status"
}

@test "capitalize goodbye" {
  run capitalize goodbye 
  correct='gOOdbyE'
  testhelper "$correct" "$output" "0" "$status"
}

#test with no arguments. should return 1
@test "capitalize" {
  run capitalize 
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status"
}
