---
layout: review
title:  "Rethinking the Value of Network Pruning"
tags:   deep-learning CNN network-pruning
author: Carl Lemaire
pdf:    "https://openreview.net/forum?id=rJlnB3C5Ym"
cite:
    authors: "Zhuang Liu, Mingjie Sun, Tinghui Zhou, Gao Huang, Trevor Darrell"
    title:   "Rethinking the Value of Network Pruning"
    venue:   "In review for ICLR 2019"
---

This work contradicts the "Lottery Ticket Hypothesis" paper. While in the latter, it is said that training large networks makes it more likely to have good features and acheive good performance, this new paper shows that training a small network from scratch gives comparable or better results than pruning and fine-tuning a large model.

They have two main conclusions:

* "training a small pruned model from scratch can almost always achieve the same or higher level of accuracy than a model fine-tuned from inherited weights".
* "the value of automatic pruning algorithms could be regarded as searching efficient architectures". In other words, pruning is good for finding a new architecture that you will then train from scratch.

# Experiments

#### L1 norm based pruning
![](/pruning-acceleration/images/rethinking/tab1.png)

#### ThiNet
![](/pruning-acceleration/images/rethinking/tab2.png)

#### Regression based Feature Reconstruction
![](/pruning-acceleration/images/rethinking/tab3.png)

#### Network Slimming
![](/pruning-acceleration/images/rethinking/tab4.png)

#### Non-structured pruning
![](/pruning-acceleration/images/rethinking/tab6.png)

#### Pruning for detection task
![](/pruning-acceleration/images/rethinking/tab7.png)

#### Pruning is good for architecture search
![](/pruning-acceleration/images/rethinking/fig3.png)
