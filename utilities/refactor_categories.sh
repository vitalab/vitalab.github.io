#!/bin/bash

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..

src_categories=('medical-imaging' 'pruning-acceleration' 'reinforcement-learning' 'video-analysis')

target=''

for folder in "${src_categories[@]}"; do

  # The posts in 'video_analysis' belong to the ML category
  if [ $folder == 'video-analysis' ]; then
    target='machine-learning'
  else
    target='deep-learning'
  fi

  # Move the contents
  mv $folder/_posts/* $target/_posts/
  mv $folder/images/* $target/images/

  # Fix the image references
  # Print occurrences for visual control
  pattern=".*\!\[\](/${folder}/.*)"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="\!\[\]\(/${folder}"
  replacement="\!\[\]\(/${target}"
  find ${target}/_posts/ -name '*.md' -exec sed -r -i "s@$pattern@$replacement@" {} +

  rm -r $folder

done
