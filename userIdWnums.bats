#!/usr/bin/env bats

#The userIdWnums function outputs the number of user accounts that
#contain a number in the username.
#For example, db76662 is a username that contains a number. The
#function also returns 0. All usernames begin with a lower case letter or
#an underscore, and are followed by lower case letters, underscores, dashes
#or numbers.
userIdWnums() {
  #TODO
  #The /etc/passwd file contains a line for each user account on the student 
  #machine.  
  #Hint: use grep with a regular expression (thus, you'll need -E option). 
  #The regular expression will match the usernames before the first : (the username).
  #grep will output the lines. You'll need another command to count them.
  #Your regular expression should match the description of usernames above.
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

#test the userIdWnums function
@test "userIdWnums" {
  #You can run the C program userIdWnums at the path below
  #to see what the answer should be.
  correct="$(/u/css/classes/5521/241/lab1/userIdWnums)" 
  run userIdWnums
  testhelper "$correct" "$output" "0" "$status"
}
