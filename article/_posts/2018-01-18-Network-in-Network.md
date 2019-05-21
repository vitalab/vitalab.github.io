---
layout: review
title: "(NiN) Network In Network"
tags: deep-learning CNN MLP
author: "Pierre-Marc Jodoin"
cite:
    authors: "M. Lin, Q. Chen, S. Yan"
    title:   "Network In Network"
    venue:   "ICLR 2014"
pdf: "arxiv.org/pdf/1312.4400.pdf"
---

## Summary

The **conventional convolutional layer** uses **linear filters** followed by a **nonlinear activation function** to scan the input feature maps as shown in Figure 1(a).  In this paper, they propose a new type of conv layer by replacing the linear filters+nonlinearity by a **micro multilayer perceptron** as shown in Figure 1(b). The feature maps are obtained by sliding the micro networks over the input in a similar manner as CNN; they are then fed into the next layer.

A 3-layer NiN network is shown in Figure 2.  The last layer is a **global average pooling**.

The **advantages** of the NiN are two-fold:

1. NiN networks get better accuracy with fewer layers because each layer implements a more complex non-linearity function.
2. The last feature maps are easier to visualize and interpret as confidence maps (c.f Figure 4).


![](/article/images/nin/sc01.jpg)

![](/article/images/nin/sc02.jpg)

![](/article/images/nin/sc03.jpg)


## Experiments and Results

They show better results on CIFAR10, CIFAR100, MNIST, and SVHN

![](/article/images/nin/sc04.jpg)

## Code

[Keras code](https://stats.stackexchange.com/questions/273486/network-in-network-in-keras-implementation)

[Caffe code](https://stats.stackexchange.com/questions/273486/network-in-network-in-keras-implementation)



