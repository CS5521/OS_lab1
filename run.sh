#!/usr/bin/bash

#This script runs all of the bats tests

echo "0) add.bats"
./add.bats

echo "1) loggedon.bats"
./loggedon.bats

echo "2) userIdWnums.bats"
./userIdWnums.bats

echo "3) userIdNnums.bats"
./userIdNnums.bats

echo "4) capitalize.bats"
./capitalize.bats

echo "5) countDateNums.bats"
./countDateNums.bats

echo "6) switchLets.bats"
./switchLets.bats

echo "7) handleCSV.bats"
./handleCSV.bats

echo "8) pppath.bats"
./pppath.bats

echo "9) lsdirs.bats"
./lsdirs.bats

echo "10) recdirs.bats"
./recdirs.bats

echo "11) revline.bats"
./revline.bats

echo "12) convline.bats"
./convline.bats

echo "13) normwhite.bats"
./normwhite.bats

echo "14) chgext.bats"
./chgext.bats

echo "15) which.bats"
./which.bats

echo "16) find.bats"
./find.bats

echo "17) backup.bats"
./backup.bats

