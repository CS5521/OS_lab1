#!/usr/bin/env bats

#The userIdNums function outputs the number of user accounts that
#contain a number in the username.
#For example, db76662 is a username that contains a number. The
#function also returns 0.
userIdWnums() {
  #TODO
  #The /etc/passwd file contains a line for each user account on the student 
  #machine.  
  #Hint: use grep with a regular expression (thus, you'll need -E option). 
  #The regular expression will match the usernames before the first : (the username).
  #grep will output the number of lines. You'll need another command to count them.
  #put your one line bash script here
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

#test the userIdWnums function
@test "userIdWnums" {
  #You can run the C program userIdWnums at the path below
  #to see what the answer should be.
  correct="$(/u/css/classes/5521/241/lab1/userIdWnums)" 
  run userIdWnums
  testhelper "$correct" "$output" "0" "$status"
}
