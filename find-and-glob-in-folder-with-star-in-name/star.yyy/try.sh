#!/bin/bash
try() {
  echo "try! HAHA [1]"
  echo $(basename $0)
  echo "$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
}
try
