---
layout: review
title: "An exponential learning rate schedule for deep learning"
tags: CNN essentials optimization
author: "Marco Armenta"
cite:
    authors: "Zhiyuan Li and Sanjeev Arora"
    title:   "An exponential learning rate schedule for deep learning"
    venue:   "ICLR 2019"
pdf: "https://arxiv.org/pdf/1910.07454.pdf"
---


# Introduction

In this paper they show that when using bathc normalization and weight decay one can use an **exponentially increasing** learning rate and still have good results. They also present a mathematical proof that the exponential learning rate is equivalent to BN + SGD + StandardRateTuning + WeightDecay + Momentum.

* It is usual when using BN to lower the learning rate when the validation loss is plateau-ing.


![](/article/images/ExponentialLR/sc01.jpg)   

They use scale invariance to manage the computations on the proofs, namely:

![](/article/images/ExponentialLR/sc02.jpg)   

# Worm up

First they show that Fixed LR + Fixed WD can be translated to an equivalent Exponential LR. Consider the following notation

![](/article/images/ExponentialLR/sc03.jpg)   

Then the theorem reads:

![](/article/images/ExponentialLR/sc04.jpg)   

# Main Theorem

![](/article/images/ExponentialLR/sc05.jpg)   
![](/article/images/ExponentialLR/sc06.jpg)   

An example of this theorem is:

![](/article/images/ExponentialLR/sc07.jpg)   

# Correcting Momentum





# Conclusion

With this visualization method, the authors came to validate the following statements:

* as networks become **very deep**, neural loss landscapes go from almost convex to very chaotic.  Also, chaotic landscape = poor trainability and large generalization error
* **residual connections** (ResNet, wideResNet, etc) and **skip connections** (DenseNet) enforces smooth landscapes
* **Sharp loss landscape** = large generalization error.
* **Flat loss landscape** = low generalization error.
* the width of the global minima is **inversely proportional to batch size**.

