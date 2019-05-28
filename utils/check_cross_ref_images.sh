#!/bin/bash

# Utility functions
usage() {
cat << EOF
Usage: $0 <file_list>
Use this script to check the existence of the cross-references files.
EOF
}

die() {
  echo "$@" 1>&2; exit 1
}

# Parse arguments
help=false
folder_id=""
while test $# -gt 0;
do
  opt="$1";
  case "$opt" in
    "-h"|"--help")
      shift;
      help=true
      break;;
    *)
      break;;
  esac
done

files=("$@")

if test "${files}" = "" || $help; then
  usage
  exit 1
fi


images_list=()

check_files_exist() {
  local file
  for file in "${images_list[@]}"; do
    abs_filename="$(pwd)$file"
    if [ ! -f "$abs_filename" ]; then
      echo "'$file' does not exist as a file."
    fi
  done
}

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..


for file in "${files[@]}"; do

  echo $file

  # Look for the cross-referenced images in the files
  pattern=".*\!\[.*\](\(.*\))"
  IFS=$'\n' images_list=($(sed -n -e "s/$pattern/\1/p" $file))

  check_files_exist

  pattern="<img src=[^\"]*\"\([^\"]*\)\".*"
  IFS=$'\n' images_list=($(sed -n -e "s/$pattern/\1/p" $file))

  check_files_exist

done
