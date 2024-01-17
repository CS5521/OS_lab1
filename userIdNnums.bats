#!/usr/bin/env bats

#This function outputs to standard out the number of user
#accounts that do NOT contain a number in the username.
#For example, db76662 is a username that contains a number.
#It also returns 0.
#All usernames begin with a lower case letter or
#an underscore, and are followed by lower case letters, underscores, dashes
#or numbers.
userIdNnums() {
  #TODO
  #The /etc/passwd file contains a line for each user account on the student 
  #machine.  
  #Hint: Depending upon how you implemented userIdWnums, this should be a very 
  #simple modification to that code. 
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

#test the userIdNnums function
@test "userIdNnums" {
  #run ./userIdNums at the command line to see
  #what the correct answer is
  correct="$(/u/css/classes/5521/241/lab1/userIdNnums)" 
  run userIdNnums
  testhelper "$correct" "$output" "0" "$status"
}
