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


status=0
non_existing_file_count=0

check_files_exist() {
  local cross_ref_file
  for cross_ref_file in "${images_list[@]}"; do
    abs_filename="$(pwd)$cross_ref_file"
    if [ ! -f "$abs_filename" ]; then
      non_existing_cross_ref_fnames+=("$cross_ref_file")
      ((non_existing_file_count++))
    fi
  done
}

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..


images_list=()

for file in "${files[@]}"; do

  non_existing_cross_ref_fnames=()

  # Look for the cross-referenced images in the files
  pattern=".*\!(\[.*\])(\(?)([^]]*)(\))(.*)"
  IFS=$'\n' images_list=($(sed -n -r "s/$pattern/\3/p" $file))

  check_files_exist

  pattern=".*<img src=[^\"]*\"\([^\"]*\)\".*"
  IFS=$'\n' images_list=($(sed -n -e "s/$pattern/\1/p" $file))

  check_files_exist

  if [[ ${non_existing_file_count} -ne 0 ]]; then
    echo $file
    IFS=$'\n' echo "${non_existing_cross_ref_fnames[*]}"

    if (( $non_existing_file_count == 1 )); then
      echo "does not exist as a file."
      echo "Please, add it or remove its references."
    else
      echo "do not exist as files."
      echo "Please, add them or remove their references."
    fi
  fi

done

if [[ $non_existing_file_count -ne 0 ]]; then
  status=1
fi

exit $status
