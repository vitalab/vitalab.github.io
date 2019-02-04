---
layout: page
title: Installing Ruby using rbenv
hidden: true  # Excluded from the menu
permalink: /how-to-install-ruby/
---

## Install dependencies

~~~
sudo apt-get update
~~~
~~~
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
~~~

## Get rbenv
In the following instructions, replace `.bashrc` by `.profile` or `.bash_profile` if you know what you're doing.

~~~
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
~~~

## Get ruby-build
~~~
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
~~~

## Install Ruby
~~~
rbenv install -v 2.4.0
rbenv global 2.4.0
~~~
Make sure you have the right version installed and selected :

~~~
ruby -v
~~~
It is likely that you will not want Rubygems to generate local documentation for each gem that you install, as this process can be lengthy. To disable this, run :

~~~
echo "gem: --no-document" > ~/.gemrc
~~~
**You are done.**

[Go back to **How to preview your post locally**](/howto/#how-to-preview-your-post-locally).
