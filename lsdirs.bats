#!/usr/bin/env bats

#The lsdirs function outputs a reverse sorted list of the 
#directories within the directory that is the
#argument to the function. The list of subdirectories
#is one per line. If no arguments are provided
#or the argument is not a directory the function returns 1. 
#Otherwise, the function returns 0.
lsdirs() {
  #TODO
  #Requirement: You cannot use ls or find in your solution
  #Hint: put subdirectory names in an array and echo
  #      contents of array in reverse (assuming you filled
  #      the array with subdirectory names in alphabetical order)
  return 0   
}


# $1 expected output; $2 is actual output; 
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

#test lsdirs with no argument
@test "lsdirs" {
  run lsdirs
  testhelper "" "$output" "1" "$status"
}

#test lsdirs with directory argument
@test "lsdirs /etc/security" {
  run lsdirs /etc/security
  correct[0]="namespace.d"
  correct[1]="limits.d"
  correct[2]="console.perms.d"
  correct[3]="console.apps"
  #assertions
  for i in 0 1 2 3
  do
    testhelper "${correct[$i]}" "${lines[$i]}" "0" "$status"
  done
}


#test lsdirs with file that doesn't exist
@test "lsdirs /usr/bin/nofile" {
  run lsdirs /usr/bin/nofile
  testhelper "" "$output" "1" "$status"
}

#test lsdirs with file that isn't a directory
@test "lsdirs /usr/bin/at" {
  run lsdirs /usr/bin/at
  testhelper "" "$output" "1" "$status"
}
