---
layout: review
title:  "Taking A Closer Look at Domain Shift: Category-level Adversaries for Semantics Consistent Domain Adaptation"
tags:   deep-learning deep-learning, segmentation, transfer-learning
author: Charles Authier
pdf:  https://arxiv.org/abs/1809.09478v1
cite:
  authors: "Yawei Luo, Liang Zheng, Tao Guan, Junqing Yu, Yi Yang"
  title:   "Taking A Closer Look at Domain Shift: Category-level Adversaries for Semantics Consistent Domain Adaptation"
  venue:   "Arxiv, 25 Sep 2018"
---

## Main Idea
A new network named category-level adversarial network (CLAN), aiming to address the problem of semantic inconsistency incurred by global feature alignment during unsupervised domain adaptation (UDA).

![](/article/images/CLAN/clan_uda.png)

CLAN adaptively weights the adversarial loss for each feature according to how well their category-level alignment is.
This method effectively prevents the well-aligned features from being incorrectly mapped by the side effect of pure global distribution alignment.

## CLAN

![](/article/images/CLAN/clan_network.png)

Feature Extractor: a DeepLab-v2 framework with ResNet-101 pre-trained on ImageNet or a VGG-16 based FCN8s, with an SGD optimizer.

Descriminator: 5 convolution layers with kernel 4 × 4, with channel numbers {64, 128, 256, 512, 1} and stride of 2.
Each convolution layer is followed by a Leaky-ReLU parameterized by 0.2.
Finally, an up-sampling layer to the last layer to rescale the output to the size of the input map, to match the size of the local alignment score map.

## Loss

![](/article/images/CLAN/clan_allloss.png)

### Segmentation loss

![](/article/images/CLAN/clan_segloss.png)

### Weight discrepancy loss

![](/article/images/CLAN/clan_weightloss.png)

### Category-level adversarial loss

![](/article/images/CLAN/clan_adloss.png)

## Results

![](/article/images/CLAN/clan_table.png)

![](/article/images/CLAN/clan_fig.png)

## To Understand

We can improve the prediction on a new dataset by using a pre-trained network on another dataset by given some image from the new dataset. Those images from the new dataset do not need to be labelled.
