#!/bin/bash

# Make sure we are inside the repository
cd "${BASH_SOURCE%/*}" &&


echo "Configuring git hooks..."

hooks_folder=$(pwd)'/hooks'

major=$(git --version | grep -o '[0-9.]*' | awk -F \. {'print $1'})
minor=$(git --version | grep -o '[0-9.]*' | awk -F \. {'print $2'})

if [ $major -eq "2" ] && [ $minor -lt "9" ]; then
  find $hooks_folder -type f -exec ln -sf ../../{} .git/hooks/ \;
else
  git config core.hooksPath $hooks_folder
fi

echo "Done configuring git hooks."
