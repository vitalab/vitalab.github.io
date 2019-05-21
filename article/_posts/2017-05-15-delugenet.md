---
layout: review
title:  "DelugeNet : Deep Networks with Massive and Flexible Cross-layer Information Inflows"
tags:   deep-learning CNN classification
author: Pierre-Marc Jodoin
pdf:   "https://arxiv.org/pdf/1611.05552.pdf"

cite:
  authors: "J. Kuen, X. Kong, and G. Wang"
  title:   "DelugeNets: Deep Networks with Massive and Flexible Cross-layer Information Inflows"
  venue:   "Not yet published : arXiv:1611.05552 "
---

DelugeNet is some sort of [DenseNet]({{ site.baseurl }}{% link article/_posts/2017-03-31-densenet.md %}) but with a series of `blocks` and ``composite layers``.   The layers operating on the same feature map dimensions can be grouped to form a `block`.  The layers inside the block are fully connected as for DenseNet.

<div align="middle">
  <img src="/article/images/delugeNet/sc01.jpg" width="700">
</div>

<br>

The layers inside a block are `bottleneck` layers similar to that used in [ResNet]({{ site.baseurl }}{% link article/_posts/2017-03-16-resnet.md %}) (c.f Fig.1(a)).  The configuration of a `block` is shown in Fig.1(c).  

<div align="middle">
  <img src="/article/images/delugeNet/sc02.jpg" width="800">
</div>
<br>

In order to reduce the number of parameters, DelugeNet uses before the bottleneck layer a `cross-layer depthwise convolutional` layer (the red arrow in Fig.1) which concatenates the channels of feature map outputs of many layers, and then applies (channel,spatial)-independent filters to the concatenated channels (c.f. Fig.2).  At the end of a `block` is a `transition` layer made of a `cross-layer depthwise convolutional` layer followed by 3×3 spatial convolutional layer.

<br>


<div align="middle">
  <img src="/article/images/delugeNet/sc04.jpg" width="400">
</div>

## Results

Deluge net is slighly more accurate than Densenet on CIFAR100 (not really on CIFAR10 though) while having fewer parameters.

<div align="middle">
  <img src="/article/images/delugeNet/sc03.jpg" width="800">
</div>

