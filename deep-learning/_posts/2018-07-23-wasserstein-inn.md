---
layout: review
title: "Wasserstein Introspective Neural Networks "
tags: deep-learning CNN GAN
author: Frédéric Branchaud-Charron
cite:
    authors: "Kwonjoon Lee, Weijian Xu, Fan Fan, Zhuowen Tu"
    title:   "Wasserstein Introspective Neural Networks"
    venue:   "CVPR 2018"
pdf:   "http://pages.ucsd.edu/~ztu/publication/cvpr18_winn.pdf"
---

The authors propose to apply the Wasserstein distance to **Introspective Neural Networks (INN)**. This work is heavily inspired by WGAN.

INNs are models which are both classifiers and generators. They do so by using **gradient ascent** to generate new samples. Just like WGAN, they used the Wasserstein distance instead of the Jensen-Shannon distance.

Gradient ascent is a technique used typically to perform style transfer. The idea is to let the gradient modify the original images such that it minimizes the loss. In style transfer for example, the image is minimized such that it keeps its original features while including features from the style image.

The model is described in fig. 1.
![](/deep-learning/images/winn/fig1.png)

The algorithm is quite simple as we see in Algorithm 1. They alternate gradient descent and gradient ascent. It is to be noted that the *pseudo-negative* samples are reused.

![](/deep-learning/images/winn/algo1.png)

Using a combination of 4 WINN models, they get an Inception score close to the real WGAN with 20 times less parameters.


![](/deep-learning/images/winn/fig6.png)

The code is available here : https://github.com/kjunelee/WINN
