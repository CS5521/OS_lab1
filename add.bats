#!/usr/bin/env bats

#This function returns the sum of its command line arguments
add()
{
  result=0
  #go through the function arguments
  for arg 
  do
     #if the argument is a number then 
     #add it to the total
     if [[ $arg =~ ^[[:digit:]+]$ ]]
     then
        let result=$result+$arg
     fi
  done
  echo $result
  return 0
}
  
#each of these are tests of the function executed by bats

@test "add 1 2 3" {
  #call the add function
  #1 2 3 are the command line arguments
  run add 1 2 3
  correct="6"
  # $output contains what was written to standard output by the function
  # $status contains what was returned by the function
  #These outputs not seen unless an assertion fails
  echo "ERROR: status = $status"
  echo "ERROR: output = $output"
  #assertions
  [ "$output" = "$correct" ] 
  [ "$status" = "0" ]
}

#test that non-numeric arguments are skipped
@test "add 1 2 ab 3" {
  run add 1 2 ab 3
  correct="6"
  echo "ERROR: status = $status"
  echo "ERROR: output = $output"
  [ "$output" = "$correct" ]
  [ "$status" = "0" ]
}


#test that non-numeric arguments are skipped
@test "add a1 2 ab 3" {
  run add a1 2 ab 3
  correct="5"
  echo "ERROR: status = $status"
  echo "ERROR: output = $output"
  [ "$output" = "$correct" ]
  [ "$status" = "0" ]
}

