#!/usr/bin/env bats

#The backup function takes two arguments, a source directory
#and a destination directory, and creates a tar file out of
#the source directory and copies it into the destination
#directory.
#It creates the tar file using the command: tar cf <tarfilename> <srcdirname>
#The name of the tar file will be <srcdirname>-N.tgz
#where N is the number of the last tar file to be created plus 1.
#
#For example, if the function is invoked by the
#command: backup srcd destd
#then the first backup created will be named: srcd-0.tgz
#It will be stored in the destd directory.
#If it is called again with the same srcd then the second
#backup created will be named: srcd-1.tgz
#The third is srcd-2.tgz, etc. These are all stored in the destd
#directory.
#
#In addition, if after creating the backup there are four backups
#in the destination directory, the backup function deletes the
#oldest backup.  For example, after creating srcd-3.tgz,
#srcd-0.tgz gets deleted; after creating srcd-4.tgz, srcd-1.tgz
#gets deleted, etc.
#
#The function should also check the arguments to make sure they
#are both directories. If not, backup returns 1 and
#outputs the message: usage: backup <srcdir> <destdir> 
#Otherwise, backup returns 0 in addition to doing the backup.
backup() {
  #TODO
  # You can use this to print error message: echo "usage: backup <srcdir> <destdir>"
  # There should be exactly two arguments and they both should be names of
  # directories

  #Hint:use the ls command with the -t option to get the order
  #     of the tar files in the dest directory that match the src directory name
  #     The -t option will order them by age youngest to oldest
  #     After you get the list of files, you'll need to access that
  #     list to get the youngest file and the file number and
  #     the oldest file and the oldest file number.
  #     You can use pattern matching to get the number. 
  return 0
}

#1 = tar file name; $2 = test number; $3 = status
testhelper()
{
  if [ ! -e "$1" ];
  then
    echo "ERROR: $1 missing ($2 call to backup)"
  fi
  [ -e "$1" ]
  if [ "$3" != "0" ];
  then
    echo "ERROR: status = $status"
  fi
  [ "$3" = "0" ]
}

#test creating one backup
@test "backup src bkup (one backup)" {
# This tests one simple backup
# It creates the files and then deletes
# them when done.
  rm -f -r bkup
  rm -f -r src
  mkdir -p src
  cp backup.bats src
  mkdir -p bkup

  run backup "src" "bkup"
  testhelper "bkup/src-0.tgz" "first" "$status"

  #this can be used to display the results of any
  #echos you put in the function when test fails
  echo $output  
}

#test creating three backups
@test "backup src bkup (three backups)" {
# This tests three backup.
# It creates the files and then deletes
# them when done.
  rm -f -r bkup
  rm -f -r src
  mkdir -p src
  cp backup.bats src
  mkdir -p bkup

  run backup "src" "bkup"
  #give new file a chance to get old
  sleep 2
  testhelper "bkup/src-0.tgz" "first" "$status"
  #this can be used to display the results of any
  #echos you put in the function when test fails
  echo $output  

  run backup "src" "bkup"
  #give new file a chance to get old
  sleep 2
  testhelper "bkup/src-0.tgz" "first" "$status"
  testhelper "bkup/src-1.tgz" "first" "$status"
  echo $output

  run backup "src" "bkup"
  testhelper "bkup/src-0.tgz" "third" "$status"
  testhelper "bkup/src-1.tgz" "third" "$status"
  testhelper "bkup/src-2.tgz" "third" "$status"
  echo $output
}

#test creating four backups
@test "backup src bkup (four backups; oldest deleted)" {
# This tests three backup.
# It creates the files and then deletes
# them when done.
  rm -f -r bkup
  rm -f -r src
  mkdir -p src
  cp backup.bats src
  mkdir -p bkup

  run backup "src" "bkup"
  sleep 2
  testhelper "bkup/src-0.tgz" "first" "$status"
  echo $output

  run backup "src" "bkup"
  sleep 2
  testhelper "bkup/src-0.tgz" "second" "$status"
  testhelper "bkup/src-1.tgz" "second" "$status"
  echo $output

  run backup "src" "bkup"
  sleep 2
  testhelper "bkup/src-0.tgz" "third" "$status"
  testhelper "bkup/src-1.tgz" "third" "$status"
  testhelper "bkup/src-2.tgz" "third" "$status"
  echo $output

  #this should delete the oldest
  #and create a new one 
  run backup "src" "bkup"
  testhelper "bkup/src-1.tgz" "fourth" "$status"
  testhelper "bkup/src-2.tgz" "fourth" "$status"
  testhelper "bkup/src-3.tgz" "fourth" "$status"
  if [ -e "bkup/src-0.tgz" ]; then
    echo "ERROR: bkup/src-0.tgz should have been deleted (fourth call to backup)"
  fi
  [ ! -e "bkup/src-0.tgz" ]
  echo $output
}

#test calling backup with no arguments
@test "backup (missing arguments)" {
  run backup
  [ "$output" == "usage: backup <srcdir> <destdir>" ]
  [ $status -eq 1 ]
}

#test calling backup with bad argument
@test "backup src bkup (bkup directory doesn't exist)" {
  rm -f -r bkup
  rm -f -r src
  mkdir -p src
  cp backup.bats src
  run backup "src" "bkup"
  [ "$output" == "usage: backup <srcdir> <destdir>" ]
  [ $status -eq 1 ]
}

#test calling backup with bad argument
@test "backup src bkup (src is a file; not a directory)" {
  rm -f -r bkup
  rm -f -r src
  touch src
  mkdir -p bkup
  cp backup.bats src
  run backup "src" "bkup"
  [ "$output" == "usage: backup <srcdir> <destdir>" ]
  [ $status -eq 1 ]
}

#performed at the end to delete leftover directories
@test "clean up any leftover directories" {
  rm -f -r bkup
  rm -f -r src
}
