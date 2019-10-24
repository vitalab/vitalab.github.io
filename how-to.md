---
layout: page
title: How-to
permalink: /howto/
---

## How to add a review

The process for adding reviews is _git-centric_. Basically, **you just need to add a file to the repo and make a pull request**. Let's go into the details :

0.  Send an e-mail to Pierre-Marc Jodoin asking him to include you as a member of the [github.com/vitalab](https://github.com/vitalab) organization.
1.  Clone the [`vitalab.github.io`](https://github.com/vitalab/vitalab.github.io) repo on your computer.
2.  Set up the `pre-commit` hooks by executing the `utils/setup_hooks.sh` script.
3.  Determine the category in which you will add your post. Categories are managed using folders :  

    ~~~
    _posts/           # A post added here will have no category
    course/
        _posts/       # A post added here will be in the "course" category
    machine-learning/
        _posts/       # Same thing for the "machine-learning" category
    ...               # There are other categories, you can add one too.
    ~~~
4.  Create a file `YYYY-MM-DD-title-of-your-review.markdown` and put it in right folder (see above).  
It is **important that you respect this format : date at the beginning and no spaces.** Else the page won't build properly. Here is an example of a valid name : `2017-01-31-going-deeper-with-convolutions.markdown`.
5.  Use the `review` template file in the [`templates`](https://github.com/vitalab/vitalab.github.io/tree/master/templates/review_template.md )
as a starting point and do your review.

    A minimal working review example may look like:

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
    ![](/article/images/MyReview/UNetArchitecture.jpg)

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

**NOTE:** the *essentials* tags is used for any paper considered as being a
"must-read".

For further information about Jekyll's syntax, visit the [documentation page](https://jekyllrb.com/docs/).
However, note that Jekyll's syntax may change in newer versions, and the site's
version is freezed. Hence, although [Liquid tags](https://jekyllrb.com/docs/liquid/tags/)
could be used for links, for example, plain old links are used to avoid issues
building the site.

You can [preview your post while you write it](#how-to-preview-your-post-locally) ; see the next section about this.\\

6.  **Make a new branch**, commit your file and push your branch.
7.  [**Create a pull request**](https://github.com/vitalab/vitalab.github.io/compare) on the repo's github page.
8.  **Add reviewers**: everyone that you think are knowledgeable about the subject or simply would be interested in your review.
9.  When every reviewer approved your branch, **merge your branch and delete it**.

## How to preview your post locally

This site is built around [**Jekyll**](https://jekyllrb.com/). Jekyll takes all the markdown files and generates a static html website.

1.  [Install Ruby using rbenv](/how-to-install-ruby). Don't use `apt-get` since its version of Ruby is too old.
2.  Install Jekyll by running : `gem install bundler jekyll`.
3.  Go where you cloned the VITAL literature review repository and run : `bundle install`. This will install the dependencies for our Jekyll site.
4.  Run a local webserver using : `bundle exec jekyll serve`.
5.  Access the site locally at : <http://127.0.0.1:4000/>

Note that the site is automatically rebuilt when a file has been modified.
