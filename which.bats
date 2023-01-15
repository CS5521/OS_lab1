#!/usr/bin/env bats


#The which function takes one argument that is the
#name of a program. It then uses the value of the path 
#variable to look for that program so that it prints the 
#path to the program that would be executed if the name
#is typed at the shell prompt. (It does the same thing
#as the linux which command.)
#
#If the program can not be found it outputs
#"no $1" 
#Of course, $1 is the parameter
#
#In either case, it returns 0.
#If no argument it provided, it returns 1.
which() {
  #TODO
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

#should return 1 if no argument given
@test "which with no argument" {
  run which
  testhelper "" "$output" "1" "$status"
}

#should find the path to gcc
@test "which gcc" {
  run which "gcc"
  correct=$(/usr/bin/which gcc)
  testhelper "$correct" "$output" "0" "$status"
}

#should find the path to pats
@test "which bats" {
  run which "bats"
  correct=$(/usr/bin/which bats)
  testhelper "$correct" "$output" "0" "$status"
}

#should not find the path to blah and
#therefore output "no blah"
@test "which blah (should return: no blah)" {
  run which "blah"
  correct="no blah"
  testhelper "$correct" "$output" "0" "$status"
}
