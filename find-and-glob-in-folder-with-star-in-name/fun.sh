#!/bin/bash
fun() {
  for i in $(find "*.yyy" -name "*.sh" -type f -readable); do
    echo $i;
  done;
}

#Change the name of the folder "star.yyy" to "*.yyy"
#and run the following command to see the result
#(Starting with a star "*" in path is allowed in Unix but Windows)
fun

#Actual Output:
#a.yyy/try.sh
#b.yyy/try.sh
#c.yyy/try.sh
#a.yyy/try.sh b.yyy/try.sh c.yyy/try.sh *.yyy/try.sh
#*.yyy/d.sh

echo "--------------------------------------------------"

#Better but still wrong:
sol() {
  for i in $(find "*.yyy" -name "*.sh" -type f -readable); do
    local len=${#i}
    echo "${i:0:$len}";
  done;
}
sol

#Still wrong Output:
#a.yyy/try.sh
#b.yyy/try.sh
#c.yyy/try.sh
#*.yyy/try.sh
#*.yyy/d.sh

#Expected Output:
#a.yyy/try.sh
#a.yyy/a.sh
#b.yyy/try.sh
#b.yyy/b.sh
#c.yyy/try.sh
#c.yyy/c.sh
#*.yyy/try.sh
#*.yyy/d.sh
