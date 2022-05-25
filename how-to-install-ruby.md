---
layout: page
title: Installing Ruby using rbenv
hidden: true  # Excluded from the menu
permalink: /how-to-install-ruby/
---

## Install rbenv in a distro-agnostic way
Detailed instructions about how to setup Ruby can be found on the [rbenv-installer](https://github.com/rbenv/rbenv-installer)
and [rbenv](https://github.com/rbenv/rbenv) repositories. What we list below are simply the instructions to install ruby
and setup a working environment.

```shell
# Launch rbenv-installer with curl
# rbenv-installer takes care of also installing ruby-build if `rbenv install` is not already available
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# Add rbenv to your bashrc to make it visible to your system
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Verify the state of your rbenv installation with rbenv-doctor
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash
```

## Install Ruby
```shell
rbenv install -v 2.7.1
rbenv global 2.7.1
```

Make sure you have the right version installed and selected:
```shell
ruby -v
```

It is likely that you will not want Rubygems to generate local documentation for each gem that you install, as this process can be lengthy. To disable this, run:
```shell
echo "gem: --no-document" > ~/.gemrc
```

Congratulations, you are done with setting up Ruby on your machine!

[Go back to **How to preview your post locally**](/howto/#how-to-preview-your-post-locally).
