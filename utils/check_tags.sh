#!/bin/bash

files=("$@")

not_in_tag_list=()

find_non_existing_tags() {
  for item1 in "${article_tags[@]}"; do
    for item2 in "${tag_list[@]}"; do
      [[ $item1 == "$item2" ]] && continue 2
    done

    # If we reached here, nothing matched
    not_in_tag_list+=( "$item1" )
  done
}

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..


tags_file='./_data/tags.yml'

# Read the tags
pattern='\(-[[:blank:]]\)\(.*\)'
IFS=$'\n' tag_list=($(sed -n -e "s/$pattern/\2/p" $tags_file))


for file in "${files[@]}"; do

  echo $file

  # Look for the tags in the files
  pattern='(tags:\s*)\"?([^\"]*)\"?/'
  IFS=$', ' article_tags=($(sed -n -E "s/$pattern \2/p" $file))

  find_non_existing_tags

  echo "The following tags are not contained in the $tags_file file:"
  echo ${not_in_tag_list[@]}
  echo "Please, add them before committing."

done
