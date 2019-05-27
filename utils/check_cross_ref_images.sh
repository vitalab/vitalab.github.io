#!/bin/bash

images_list=()

check_files_exist() {
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

# Look for the tags in the Markdown file of the commit
post_added=$(git diff-index --diff-filter=A --cached HEAD -- '*.md')

pattern=".*\!\[.*\](\(.*\))"
IFS=$'\n' images_list=($(sed -n -e "s/$pattern/\1/p" $post_added))

check_files_exist
