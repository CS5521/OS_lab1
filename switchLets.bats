#!/usr/bin/env bats

#The switchLetters function outputs its argument
#with the first three and the last three characters
#switched. If the function is called without
#an argument, it returns a status of 1. 
#If the number of characters in the 
#argument is less than three, it returns a status 
#of 1. Otherwise, it returns a status of 0 
switchLetters() {
  #TODO
  #Hint: use the pattern matching operator =~ and
  #      the BASH_REMATCH array
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

#good test
@test "switchLetters hi there" {
  run switchLetters 'hi there' 
  correct="erethhi "
  testhelper "$correct" "$output" "0" "$status"
}

#good test
@test "switchLetters: goodie" {
  run switchLetters 'goodie' 
  correct="diegoo"
  testhelper "$correct" "$output" "0" "$status"
}

#good test
@test "switchLetters abc 1234f 9 cde" {
  run switchLetters 'abc 1234f 9 cde' 
  correct="cde 1234f 9 abc"
  testhelper "$correct" "$output" "0" "$status"
}

#good test
@test "switchLetters efgh 1234" {
  run switchLetters 'efgh 1234' 
  correct="234h 1efg"
  testhelper "$correct" "$output" "0" "$status"
}

#test on no arguments; should return 1
@test "switchLetters" {
  run switchLetters
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status"
}

#argumet is less than 6 characters; should return 1
@test "switchLetters happy" {
  run switchLetters "happy"
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status"
}

