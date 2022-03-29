#!/bin/bash
funA() {
  local a="*.sh";
  echo ${a}   #funA.sh funB.sh (Actual Output. See reason 1)
  echo "${a}" #*.sh (Expected Output. See reason 2)
}
funA

#Reasons:
#1. The command "echo *" output all files in current folder
#   and "*.sh" becomes a glob to match any files with name ended in ".sh".
#   Thus, when there is a file "funB.sh" in the current directory,
#   "funA.sh funB.sh" will be output.
#   If the current directory is not same as the current file,
#   the output would be different too.
#2. The outer double quotation-marks ensures
#   the things inside is a string not glob.
