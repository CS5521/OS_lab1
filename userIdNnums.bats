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

#test the userIdNnums function
@test "userIdNnums" {
  #run ./userIdNums at the command line to see
  #what the correct answer is
  correct="$(/u/css/classes/5521/241/lab1/userIdNnums)" 
  run userIdNnums
  testhelper "$correct" "$output" "0" "$status"
}
