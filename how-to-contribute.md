---
layout: page
title: Contributors' Guide
hidden: true  # Excluded from the menu
permalink: /contribute/
---

## Table of Contents
1. [Introduction](how-to-contribute.md#introduction)
2. [Install the repository](how-to-contribute.md#install-the-vitalabgithubio-repository)
3. [Setup a Ruby environment](how-to-contribute.md#setup-a-ruby-environment)
5. [Add your own posts](how-to-contribute.md#add-your-own-posts)
6. [Preview your posts](how-to-contribute.md#preview-your-posts-locally)
7. [General troubleshooting](how-to-contribute.md#troubleshooting)

&nbsp;

## Introduction
This site is built around [Jekyll](https://jekyllrb.com/). Jekyll takes all the markdown files and generates a static HTML
website. Therefore, to easily work on your posts and preview them locally before publishing them, it requires that you
install Ruby and Jekyll. The instructions on how to setup a Ruby environment, and launch Jekyll on your local version
of the website, are provided below.

For further information about Jekyll's syntax, visit the [documentation page](https://jekyllrb.com/docs/). However, note
that Jekyll's syntax may change in newer versions, and the site's version is freezed. Hence, although
[Liquid tags](https://jekyllrb.com/docs/liquid/tags/) could be used for links, for example, plain old links are used to
avoid issues building the site.

&nbsp;

## Install the `vitalab.github.io` repository
```shell
# Clone the repository
git clone git@github.com:vitalab/vitalab.github.io.git

# Navigate to where you cloned the repository
cd vitalab.github.io

# Setup the pre-commit hooks, to ensure that the changes you commit will respect the rules enforced by the CI
bash ./utils/setup_hooks.sh
```
It is important to navigate to the folder where you cloned the repository, since **following commands in this guide will
assume you are working from inside this repository**.

&nbsp;

## Setup a Ruby environment 
Kindly refer to [Linux guide](how-to-contribute.md#linux-guide) for Linux users and [Windows guide](how-to-contribute.md#windows-guide) for Windows users.

### Ruby setup on **Linux** <a name="linux-guide"></a>
We strongly encourage following the method described below to install Ruby, because it does not rely on a specific Linux
package manager, and is therefore distro-agnostic. It also avoids having to deal with possibly mismatched versions of
Ruby in the repositories of some distributions, e.g. Ubuntu. If you follow another method to setup a Ruby environment,
do so at your own risk!

#### Install rbenv in a distro-agnostic way
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

#### Install Ruby
```shell
rbenv install -v 2.7.1
rbenv global 2.7.1
```

Make sure you have the right version installed and selected:
```shell
ruby -v
```

It is likely that you will not want Rubygems to generate local documentation for each gem that you install, as this
process can be lengthy. To disable this, run:
```shell
echo "gem: --no-document" > ~/.gemrc
```


### Ruby setup on **Windows** <a name="windows-guide"></a>
For Windows users, here is a quick guide to install Ruby environment. Please visit [Jekyll on Windows](https://jekyllrb.com/docs/installation/windows/) website for more information. 


#### Download and install Ruby + Devkit
1. Grab the latest version of RubyInstaller from [here](https://rubyinstaller.org/downloads/).
2. Opt for default installation. Dont forget to check the `ridk install` on the last stage of the installation wizard.


### Install the project's dependencies
```shell
# Install `bundler` to manage dependencies
gem install bundler:2.3.14

# Install the dependencies
bundle install

# Check if Jekyll has been installed properly
jekyll -v
```

Congratulations, you are done with setting up the Ruby environment for the MYRIAD website on your machine!
 
&nbsp;

## Add your own posts

The process for adding posts is *git-centric*. Basically, **you just need to add a file to the repo and make a pull request**.
Let's go into the details :

0. Make sure you are part of the [*vitalab* GitHub organization](https://github.com/vitalab). If you are not,
you can contact [Pierre-Marc Jodoin](https://info.usherbrooke.ca/pmjodoin/) to have him invite you to the organization;
1. **Create a markdown file** titled `YYYY-MM-DD-title-of-your-review.md` and put it in the [`article/_posts` folder](https://github.com/vitalab/vitalab.github.io/tree/master/article/_posts)
at the root of the repository. It is **important that you respect this format**, since the title is used to extract
metadata about the posts. If you do not respect this format, the page will not build properly. Here is an example of a
valid name: `2022-05-24-welcome-to-jekyll.md`;
2. **Write your review**. You can use the [review template](https://github.com/vitalab/vitalab.github.io/tree/master/templates/review_template.md)
as a starting point. A more fleshed-out example of a review is provided below:
    ```markdown
    ---
    layout: review
    title: U-Net Convolutional Networks for Biomedical Image Segmentation
    tags: deep-learning CNN segmentation medical essentials
    cite:
        authors: "O. Ronneberger, P. Fischer, T. Brox"
        title:   "U-Net: Convolutional Networks for Biomedical Image Segmentation"
        venue:   "Proceedings of MICCAI 2015, p.234-241"
    pdf: "https://arxiv.org/pdf/1505.04597.pdf"
    ---

    # Introduction

    Famous 2D image segmentation CNN made of a series of convolutions and
    deconvolutions. The convolution feature maps are connected to the deconv maps of
    the same size. The network was tested on the 2 class 2D ISBI cell segmentation
    [dataset](http://www.codesolorzano.com/Challenges/CTC/Welcome.html).
    Used the crossentropy loss and a lot of data augmentation.

    The network architecture:
    ![](/article/images/MyReview/UNetArchitecture.png)

    A U-Net is based on Fully Convolutional Networks (FCNNs)[^1].

    The loss used is a cross-entropy:
    $$ E = \sum_{x \in \Omega} w(\bold{x}) \log (p_{l(\bold{x})}(\bold{x})) $$

    The U-Net architecture is used by many authors, and has been re-visited in
    many reviews, such as in [this one](https://vitalab.github.io/article/2019/05/02/MRIPulseSeqGANSynthesis.html).

    # References

    [^1]: Jonathan Long, Evan Shelhamer, and Trevor Darrell. Fully convolutional
          networks for semantic segmentation (2014). arXiv:1411.4038.
    ```
    The list of [available tags](https://github.com/vitalab/vitalab.github.io/blob/master/_data/tags.yml)
    can be modified to include new tags. The current ones are:

    <br>
    <table style="width:100%">
    {% assign cl_id = 0 %}
    {% assign all_tags = site.data.tags.tags | sort %}
    <tr>
    {% for tag in all_tags %}
        <td>{{tag}}</td>
        {% assign cl_id = cl_id | plus:1 %}
        {% assign end_line  = cl_id | modulo: 4 %}
        {% if end_line == 0 and cl_id > 0 %}
            </tr>
            <tr>
        {% endif %}
    {% endfor %}
    </tr>
    </table>
    <br>

3. **Make a new branch**, commit your file(s) and push your branch;
4. **Create a pull request** between your branch and the `master` branch of the repository;
5. **Add reviewers**. It is recommended to add everyone that you think are knowledgeable about the subject, but you can
also add anyone you think would be interested in your review;
6. **Merge your branch** when every reviewer approved it. Once merged, the remote branch will automatically be deleted.

&nbsp;

## Preview your posts locally
It is possible to launch a Jekyll webserver locally to inspect how your local version of the repository would look like
once published. To do so, simply follow the commands below from within the directory where you cloned the repository:
```shell
# Run a local Jekyll webserver
bundle exec jekyll serve
```
After the local Jekyll webserver is launched, you can access it at [http://localhost:4000](http://localhost:4000/).

&nbsp;

## Troubleshooting

### Running `bundle install` or `bundle exec jekyll serve` does not work
If you previously installed a version of this repo and it now does not work, you may have a version mismatch. To clean
and reinstall, try to comment all gems specification in `Gemfile` and then run:
```shell
bundle clean --force
```
then uncomment your changes in `Gemfile` and run
```shell
bundle install
```
If that does not resolve your problem, you may have a tooling version mismatch. The error messages following `bundle install`
should provide some information. Otherwise, do not hesitate to create an issue on Github to get some help.

### Running `bundle install` has modified `Gemfile.lock`
This is likely happening because you don't have Ruby 2.7.1. Confirm by running `git diff`. If you see something like this:
```diff
 RUBY VERSION
-   ruby 2.7.1
+   ruby 2.4.0p0
```
it confirms that you need to upgrade Ruby. To do so, run the following commands:
```shell
# Install the correct version of Ruby and set it as the global default
rbenv install 2.7.1
rbenv global 2.7.1

# Uninstall the previous version of Ruby
rbenv uninstall 2.4.0

# Install the dependencies for the new Ruby version
gem install bundler:2.3.14
bundle install
```
After this, there shouldn't be changes in `Gemfile.lock`.
