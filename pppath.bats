#!/usr/bin/env bats

#The pppath function pretty prints the value of the $PATH variable,
#one path per line.
#To see what the pppath function should output,
#run: /u/css/classes/5521/231/lab1/pppath
pppath() {
   #TODO
   #Hint: you can use sed and awk
   return 0   
}

@test "pppath" {
  correct="$(/u/css/classes/5521/231/lab1/pppath)" 
  run pppath
  #assertions
  [ "$status" = "0" ]
  [ "$output" = "$correct" ]
}
