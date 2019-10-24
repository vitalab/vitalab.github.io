---
layout: review
title:  "EnhanceNet : Classification Driven Dynamic Image Enhancement"
tags:   deep-learning CNN classification
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1710.07558.pdf"
cite:
  authors: "Vivek Sharma, Ali Diba, Davy Neven, Michael S. Brown, Luc Van Gool, and Rainer Stiefelhagen"
  title:   "Classification Driven Dynamic Image Enhancement"
  venue:   "CVPR 2018"
---

## Introduction

![](/article/images/enhanceNet/sc01.jpg)

As shown in Fig.1, the proposed method learns filters that are then used to enhance the input image that is then fed to an image classifier.  

The system is shown in more details in Fig.2.  The input image is first converted into the luminance-chrominance Y CbCr color space.  The first network is trained to predict luminance image enhancement filters.  The enhanced image is then contatenated back to the chrominance images and fed to a classifier.

![](/article/images/enhanceNet/sc02.jpg)

Both network are trained simulteneously, with an MSE loss for the enhance network and a cross-entropy loss for the classification network:

![](/article/images/enhanceNet/sc03.jpg)


## Results

Results are cool!  The enhance network can reproduce all kinds of image enhancement filters and improves state-of-the-art classification methods on several dataset.

![](/article/images/enhanceNet/sc04.jpg)

![](/article/images/enhanceNet/sc05.jpg)



