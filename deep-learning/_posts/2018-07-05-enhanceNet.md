---
layout: review
title:  "EnhanceNet : Classification Driven Dynamic Image Enhancement"
tags:   deep-learning CNN classification
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1710.07558.pdf"
cite:
  authors: "Vivek Sharma, Ali Diba, Davy Neven, Michael S. Brown, Luc Van Gool, and Rainer Stiefelhagen"
  title:   "Classification Driven Dynamic Image Enhancement"
  venue:   "CVPR 2015"
---

## Introduction

![](/deep-learning/images/enhanceNet/sc01.png)

As shown in Fig.1, the proposed method learns filters that are then used to enhance the input image that is then fed to an image classifier.  

The system is shown in more details in Fig.2.  The input image is first converted into the luminance-chrominance Y CbCr color space.  The first network is trained to predict luminance image enhancement filters.  The enhanced image is then contatenated back to the chrominance images and fed to a classifier.

![](/deep-learning/images/enhanceNet/sc02.png)

Both network are trained simulteneously, with an MSE loss for the enhance network and a cross-entropy loss for the classification network:

![](/deep-learning/images/enhanceNet/sc03.png)


## Results

Results are cool!  The enhance network can reproduce all kinds of image enhancement filters and improves state-of-the-art classification methods on several dataset.

![](/deep-learning/images/enhanceNet/sc04.png)

![](/deep-learning/images/enhanceNet/sc05.png)



