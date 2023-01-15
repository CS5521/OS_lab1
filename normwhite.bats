#!/usr/bin/env bats

#The normwhite function takes a multiple, varying number of
#arguments and outputs each argument after normalizing it.
#Runs of spaces and/or tabs must be replaced by a 
#single space.  All beginning and end of line whitespace must be removed.
#The function returns 0.
#
#If no argument is provided the function returns 1. 
normwhite() {
  #TODO
  #Hint: use sed.
  return 0
}

# $1 is expected output; $2 is actual output; 
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

#run normwhite with no argument (should return 1)
@test "normwhite with no argument (should return 1) " {
  run normwhite 
  #should return 1 with nothing written to standard out
  testhelper "" "$output" "1" "$status"
}

#run normwhite with a good input
@test "normwhite input.txt " {
  input[0]="a    line     with spaces     "
  input[1]="a\tline\twith\ttabs\t"
  input[2]="multiple   spaces\t\t\ttabs"
  input[3]=" \t lines\t \t"
  input[4]="\t \there \t "
  run normwhite "${input[@]}"
  correct[0]="a line with spaces"
  correct[1]="a line with tabs"
  correct[2]="multiple spaces tabs"
  correct[3]="lines"
  correct[4]="here"
  for i in 0 1 2 3 4
  do
    testhelper "${correct[$i]}" "${lines[i]}" "0" "$status"
  done
}


