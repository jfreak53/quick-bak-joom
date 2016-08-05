#!/bin/bash

[ -z "${1}" ] && echo "Must Specify output tar filename" >&2 && exit 1;

if test -f "./configuration.php"; then
  dbVar=$(grep '$db =' configuration.php | (cut -f2 -d=) | sed -r "s/'//g" | s$

  if [ -z "$dbVar" ]
    then
      echo "Variable is	Empty"
    else
      mysqldump	-u root "$dbVar" > "$dbVar".sql
      tar -czf "../${1}" ./
      echo "File ${1} backed up"
    fi
else
  echo "Configuration file does	not exist."
fi
