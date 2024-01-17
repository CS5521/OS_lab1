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

# $1 is correct output; $2 is your output; 
# $3 is correct status; $4 is your status
testhelper() {
  if [ "$1" != "$2" ]; then
    echo "ERROR: correct output is |$1|, your output is |$2|"
  fi
  #assertion
  [ "$1" = "$2" ]
  if [ "$3" != "$4" ]; then
    echo "ERROR: correct status is $3, your status is $4"
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

