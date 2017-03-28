---
layout: review
title: " GoogLeNet, Inception (Going Deeper with Convolutions)"
tags: deep-learning CNN essentials classification localization
cite:
    authors: "K He, X Zhang, S. Ren, J. Sun"
    title:   "Deep Residual Learning for Image Recognition"
    venue:   "Proceedings of CVPR 2016, p.770-778"
pdf:   "http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks.pdf"
---

 
Winner of the ILSVRC 2014 competitions, both for the classification and the localization.  The main novelty of this paper is the use of inception layers which is a series of conv layers with different receptive fields.
 
![](/deep-learning/images/googleNet/inception_2.png)

Figure 2 (a) shows a naive implementation of an inception module.  The authors argue that the use of an 1x1 convolution before the nxn spatial convolution gives better results while reducing the number of parameters.  The full network is given below.  The use of several outputs (3 softmax) encourage discrimination in the lower stages.  At test time, only the last output it kept.  The approach taken by GoogLeNet for localization is similar to that of R-CNN.

![](/deep-learning/images/googleNet/inception_1.png)

