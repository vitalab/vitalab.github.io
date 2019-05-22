#!/bin/bash

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&
cd ..

src_categories=('deep-learning' 'machine-learning' 'medical-imaging' 'pruning-acceleration' 'reinforcement-learning' 'video-analysis')

target='article'

mkdir $target
mkdir $target/_posts
mkdir $target/images

# Add the categories to the list of tags
deep_learning_tag='deep-learning'
machine_learning_tag='machine-learning'
medical_tag='medical'
prunning_acceleration_tag='pruning-acceleration'
video_analysis_tag='video-analysis'
dash='- '

prunning_acceleration_tag_file_elem="${dash} ${prunning_acceleration_tag}"
video_analysis_tag_file_elem="${dash} ${video_analysis_tag}"

tags_file='./_data/tags.yml'
tag_exists=$(grep -- $prunning_acceleration_tag $tags_file)
if [ -z "$tag_exists" ]; then
  echo $prunning_acceleration_tag_file_elem >> $tags_file
fi
tag_exists=$(grep -- $video_analysis_tag $tags_file)
if [ -z "$tag_exists" ]; then
  echo $video_analysis_tag_file_elem >> $tags_file
fi

# Skip first line when sorting the list of tags
( head -n1 $tags_file; tail -n+2 $tags_file | sort -ft$ -k2n,2 ) >file.tmp && mv file.tmp $tags_file

for folder in "${src_categories[@]}"; do

  # Add the appropriate tags to the articles that will be moved
  if [ $folder == 'deep-learning' ]; then
    find ${folder}/_posts/ -name '*.md' -exec sed -i -E "s/(tags:\s*)\"?(${deep_learning_tag} |)([^\"]*)\"?/\1${deep_learning_tag} \3/g" {} +
  elif [ $folder == 'machine-learning' ]; then
    find ${folder}/_posts/ -name '*.md' -exec sed -i -E "s/(tags:\s*)\"?(${machine_learning_tag} |)([^\"]*)\"?/\1${machine_learning_tag} \3/g" {} +
  elif [ $folder == 'medical-imaging' ]; then
    find ${folder}/_posts/ -name '*.md' -exec sed -i -E "s/(tags:\s*)\"?(${medical_tag} |)([^\"]*)\"?/\1${medical_tag} \3/g" {} +
  elif [ $folder == 'pruning-acceleration' ]; then
    find ${folder}/_posts/ -name '*.md' -exec sed -i -E "s/(tags:\s*)\"?(${prunning_acceleration_tag} |)([^\"]*)\"?/\1${prunning_acceleration_tag} \3/g" {} +
  elif [ $folder == 'video-analysis' ]; then
    find ${folder}/_posts/ -name '*.md' -exec sed -i -E "s/(tags:\s*)\"?(${video_analysis_tag} |)([^\"]*)\"?/\1${video_analysis_tag} \3/g" {} +
  fi

  # Move the contents
  mv $folder/_posts/* $target/_posts/
  mv $folder/images/* $target/images/

  # Fix the image references
  # Print occurrences for visual control
  pattern=".*\!\[.*\](/${folder}/.*)"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="\(.*\!\[.*\].*\)\(${folder}\)\(.*\).*"
  replacement="\1${target}\3"
  find ${target}/_posts/ -name '*.md' -exec sed -i "s/$pattern/$replacement/g" {} +


  # Print occurrences for visual control
  pattern=".*<img[[:space:]]src=\"/${folder}/.*"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="<img src=\"/${folder}"
  replacement="<img src=\"/${target}"
  find ${target}/_posts/ -name '*.md' -exec sed -r -i "s@$pattern@$replacement@g" {} +


  # Fix the cross-references to other review articles
  # Print occurrences for visual control
  pattern=".*https://vitalab.github.io/${folder}.*"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="https://vitalab.github.io/${folder}"
  replacement="https://vitalab.github.io/${target}"
  find ${target}/_posts/ -name '*.md' -exec sed -r -i "s@$pattern@$replacement@g" {} +

  # Print occurrences for visual control
  pattern=".*{%[[:space:]]post_url[[:space:]]/${folder}/.*}"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="\{% post_url /${folder}"
  replacement="\{% post_url /${target}"
  find ${target}/_posts/ -name '*.md' -exec sed -r -i "s@$pattern@$replacement@g" {} +

  # Print occurrences for visual control
  pattern=".*{%[[:space:]]link[[:space:]]${folder}/.*}"
  find ${target}/_posts/ -name '*.md' -exec grep -e $pattern {} \; -print

  # Do the replacement
  pattern="\{% link ${folder}"
  replacement="\{% link ${target}"
  find ${target}/_posts/ -name '*.md' -exec sed -r -i "s@$pattern@$replacement@g" {} +

  rm -r $folder

done
