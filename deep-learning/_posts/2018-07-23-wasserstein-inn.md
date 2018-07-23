---
layout: review
title: "VggNet: Very Deep Convolutional Networks for Large-Scale Image Recognition"
tags: deep-learning CNN essentials classification
cite:
    authors: "K. Simonyan, A. Zisserman"
    title:   "Very Deep Convolutional Networks for Large-Scale Image Recognition"
    venue:   "Proceedings of ICLR 2015, p.1-14"
pdf:   "https://arxiv.org/pdf/1409.1556.pdf"
project page: "http://www.robots.ox.ac.uk/~vgg/research/very_deep/"
---

The authors propose to apply the Wasserstein distance to **Introspective Neural Networks (INN)**. This work is heavily inspired by WGAN.

INNs are models which are both classifiers and generators. They do so by using **gradient ascent** to generate new samples. Just like WGAN, they used the Wasserstein distance instead of the Jensen-Shannon distance.

The model is described in fig. 1.
![](/deep-learning/images/winn/fig1.png)

The algorithm is quite simple as we see in Algorithm 1. They alternate gradient descent and gradient ascent. It is to be noted that the *pseudo-negative* samples are reused.

![](/deep-learning/images/winn/algo1.png)

Using a combination of 4 WINN models, they get an Inception score close to the real WGAN with 20 times less parameters.


![](/deep-learning/images/winn/fig6.png)
