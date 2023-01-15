#!/usr/bin/env bats

#The revline function accepts as input an argument that
#is a sentence. It reverses the words in the sentence so that
#the last word in the input is the first word in the output,
#the second to last word in the input is the second word in
#the output, etc.  If no arguments are provided, the function
#returns 1. Otherwise, the function returns 0.
revline() {
  #TODO
  return 0   
}

# $1 is expected output; $2 is actual output; 
# $3 is expected status; $4 is actual status
testhelper() {
  if [ "$1" != "$2" ]; then
    echo "ERROR: expected output is $1, actual output is $2"
  fi
  #assertion
  [ "$1" = "$2" ]
  if [ "$3" != "$4" ]; then
    echo "ERROR: expected status is $3, actual status is $4"
  fi
  #assertion
  [ "$3" = "$4" ]
}

#test on no arguments; should return 1
@test "revline" {
  #revline with no argument
  run revline
  testhelper "" "$output" "1" "$status"
}

#test using a string argument
@test "revline hi there cs5521" {
  #revline with argument
  run revline 'hi there cs5521'
  correct="cs5521 there hi"
  testhelper "$correct" "$output" "0" "$status"
}

#test using a string argument
@test "revline how is it going" {
  #revline with argument
  run revline 'how is it going'
  correct="going it is how"
  testhelper "$correct" "$output" "0" "$status"
}

