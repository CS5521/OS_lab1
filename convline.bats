#!/usr/bin/env bats

#The convline function accepts as input an argument that
#is a string. If the string matches a pattern like
#aaa ... bb (1 or more a's followed by 0 or more of
#anything followed by 1 or more b's) it outputs the b's followed
#by a space followed by an X followed by a space followed by
#the a's.  For example, for the input aajbxabbb, the function
#would output bbb X aa. In addition, it returns 0.
#If the number of arguments is not 1 or the string
#doesn't match the pattern, the function returns 1
#and outputs nothing. 
convline() {
  #TODO
  #Hint: you can use the regular expression matching operator =~ 
  #      and the BASH_REMATCH; other methods also possible
  #Requirement: Only one regular expression allowed!
  return 1
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

#test with no arguments; should return 1
@test "convline" {
  #convline with no argument
  run convline
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status"
}

@test "convline aaabbb" {
  #convline with matching argument
  run convline 'aaabbb'
  correct='bbb X aaa'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline aabbb" {
  #convline with matching argument
  run convline 'aabbb'
  correct='bbb X aa'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline aaabjbbbb" {
  #convline with matching argument
  run convline 'aaabjbbbb'
  correct='bbbb X aaa'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline aaabjbkabbbb" {
  #convline with matching argument
  run convline 'aaabjbkabbbb'
  correct='bbbb X aaa'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline abababbabbbb" {
  #convline with matching argument
  run convline 'abababbabbbb'
  correct='bbbb X a'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline abababbabbab" {
  #convline with matching argument
  run convline 'abababbabbab'
  correct='b X a'
  testhelper "$correct" "$output" "0" "$status" 
}

@test "convline aaaaaaajbbbb" {
  #convline with matching argument
  run convline 'aaaaaaajbbbb'
  correct='bbbb X aaaaaaa'
  testhelper "$correct" "$output" "0" "$status" 
}


#test with an argument that doesn't match
@test "convline jabababbabbbb" {
  #convline with argument that doesn't match
  run convline 'jabababbabbbb'
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status" 
}

#test with an argument that doesn't match
@test "convline abababbabbbba" {
  #convline with argument that doesn't match
  run convline 'abababbabbbba'
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status" 
}
