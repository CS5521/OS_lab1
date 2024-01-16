#!/usr/bin/env bats

#The handleCSV function parses the CSV input in the file
#named by its argument. Each line of the CSV input file consists of three fields 
#separated by commas. The function removes leading and trailing whitespace 
#around each field, and #outputs each field on its own line preceding the 
#field by either 1), 2), or 3). Each ) should be followed by exactly one space.
#For example, if the input is:
#
#a, b, c
#e,f,g
#aaa,bbb,ccc
#hi, there, howdy
#
#then the output of the function is: 
#
#1) a
#2) b
#3) c
#1) e
#2) f
#3) g
#1) aaa
#2) bbb
#3) ccc
#1) hi
#2) there
#3) howdy
handleCSV() {
  #TODO
  #Requirement: use awk
  
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

@test "handleCSV CSVinput1" {
  run handleCSV /u/css/classes/5521/241/lab1/CSVinput1 
  correct[0]="1) a" 
  correct[1]="2) b" 
  correct[2]="3) c" 
  correct[3]="1) e" 
  correct[4]="2) f" 
  correct[5]="3) g" 
  correct[6]="1) aaa" 
  correct[7]="2) bbb"
  correct[8]="3) ccc"
  correct[9]="1) hi"
  correct[10]="2) there"
  correct[11]="3) howdy" 
  #$lines is an array of the output of the run
  for i in 0 1 2 3 4 5 6 7 8 9 10 11
  do
    testhelper "${correct[$i]}" "${lines[$i]}" "0" "$status"
  done
}

#test without no arguments; should return 1
@test "handleCSV" {
  run handleCSV 
  testhelper "" "$output" "1" "$status"
}

#test without bad argument (file doesn't exist); should return 1
@test "handleCSV nofile" {
  run handleCSV nofile
  testhelper "" "$output" "1" "$status"
}

#CSVinput2 exists but isn't readable; should return 1
@test "handleCSV CSVinput2" {
  run handleCSV /u/css/classes/5521/241/lab1/CSVinput2 
  testhelper "" "$output" "1" "$status"
}
