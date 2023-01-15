#!/usr/bin/env bats

#The recdirs function accepts as input an argument that
#is a directory. It outputs the name of the directory and
#the number of subdirectories in that directory. It then
#calls the function on each of the subdirectories in the
#directory. The directories and their counts will be outputted
#in a depth first order.  If no argument is provided or
#or the argument is not a directory the function 
#returns 1. Otherwise, the function returns 0.
recdirs() {
  #TODO
  #Use this echo to produce the expected output
  # echo "directory: $1, number of subdirectories: $count"
  
  # Hint: This function should be recursive. Each recursive call
  #       needs its own set of variables. You can make that happen
  #       by declaring them to be local.
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

#test recdirs with no argument; it should return 1
@test "recdirs" {
  #recdirs with no argument
  run recdirs
  testhelper "" "$output" "1" "$status"
}

#test recdirs on a directory with no subdirs
@test "recdirs $(pwd)/root (no subdirectories)" {
  path=$(pwd)
  mkdir -p "$path/root"
  run recdirs "$path/root"
  rm -f -r "$path/root"
  correct="directory: $path/root, number of subdirectories: 0"  
  testhelper "$correct" "$output" "0" "$status"
}

#test recdirs on a directory with multiple subdirs
@test "recdirs $(pwd)/root" {
  path=$(pwd)
  #first create some directories to test
  #the script on
  mkdir -p "$path/root"
  mkdir -p "$path/root/dir1"
  mkdir -p "$path/root/dir2"
  mkdir -p "$path/root/dir3"
  touch "$path/root/file1"
  touch "$path/root/file2"
  touch "$path/root/file3"
  mkdir -p "$path/root/dir1/dir1a"
  mkdir -p "$path/root/dir1/dir1a/dir1aa"
  mkdir -p "$path/root/dir1/dir1a/dir1aa/dir1aaa"
  touch "$path/root/dir1/dir1a/dir1aa/file1aaa"
  mkdir -p "$path/root/dir1/dir1a/dir1ab"
  touch "$path/root/dir1/dir1a/file1aa"
  mkdir -p "$path/root/dir2/dir2a"
  mkdir -p "$path/root/dir2/dir2b"
  touch "$path/root/dir2/file2a"
  touch "$path/root/dir2/file2b"
  run recdirs "$path/root"
  rm -f -r "$path/root"
  
  #assertions
  correct[0]="directory: $path/root, number of subdirectories: 3" 
  correct[1]="directory: $path/root/dir1, number of subdirectories: 1"  
  correct[2]="directory: $path/root/dir1/dir1a, number of subdirectories: 2"  
  correct[3]="directory: $path/root/dir1/dir1a/dir1aa, number of subdirectories: 1"  
  correct[4]="directory: $path/root/dir1/dir1a/dir1aa/dir1aaa, number of subdirectories: 0"  
  correct[5]="directory: $path/root/dir1/dir1a/dir1ab, number of subdirectories: 0"  
  correct[6]="directory: $path/root/dir2, number of subdirectories: 2" 
  correct[7]="directory: $path/root/dir2/dir2a, number of subdirectories: 0" 
  correct[8]="directory: $path/root/dir2/dir2b, number of subdirectories: 0" 
  correct[9]="directory: $path/root/dir3, number of subdirectories: 0"
  for i in 0 1 2 3 4 5 6 7 8 9
  do
    testhelper "${correct[$i]}" "${lines[i]}" "0" "$status"
  done
}

#test on an argument that is a file, not a directory; should return 1
@test "recdirs /etc/default/grub" {
  #recdirs with file argument
  run recdirs /etc/default/grub
  testhelper "" "$output" "1" "$status"
}

#test on an argument that is a file that doesn't exist; should return 1
@test "recdirs /etc/default/grubbie" {
  #recdirs with file argument
  run recdirs /etc/default/grubbie
  testhelper "" "$output" "1" "$status"
}
