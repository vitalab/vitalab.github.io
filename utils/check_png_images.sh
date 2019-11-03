#!/bin/bash

# Utility functions
usage() {
cat << EOF
Usage: $0 <file_list>
Use this script to check the existence of PNG cross-references files.
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
png_cross_ref_file_count=0

convert_png_to_jpg() {
  local cross_ref_file
  for cross_ref_file in "${images_list[@]}"; do
    abs_filename="$(pwd)$cross_ref_file"
    if [ -f "$abs_filename" ]; then
      ((png_cross_ref_file_count++))
    fi
  done
}

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..


images_list=()

for file in "${files[@]}"; do

  # Look for the cross-referenced PNG images in the files
  pattern=".*\!(\[.?\])(\(?)([^]]*.png)\)"
  IFS=$'\n' png_cross_ref_fnames=($(sed -n -r "s/$pattern/\3/p" $file))

  #pattern=".*<img src=[^\"]*\"\([^\"]*\)\".*"
  pattern=".*<img src=[^\"]*\"\([^\"]*.png\)\".*"
  IFS=$'\n' png_cross_ref_fnames+=($(sed -n -e "s/$pattern/\1/p" $file))

  png_cross_ref_file_count=${#png_cross_ref_fnames[@]}

  if [[ ${png_cross_ref_file_count} -ne 0 ]]; then
    echo $file
    IFS=$'\n' echo "${png_cross_ref_fnames[*]}"

    if (( $png_cross_ref_file_count == 1 )); then
      echo "looks like a PNG format image file."
      echo "Please, convert it to a JPEG file (*.jpg)."
    else
      echo "look like PNG format image files."
      echo "Please, convert them to JPEG files (*.jpg)."
    fi
  fi

done

if [[ $png_cross_ref_file_count -ne 0 ]]; then
  status=1
fi

exit $status
