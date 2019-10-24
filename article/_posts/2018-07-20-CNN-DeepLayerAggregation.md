---
layout: review
title:  "Deep Layer Aggregation"
tags:   deep-learning CNN segmentation classification
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1707.06484.pdf"
cite:
  authors: "Fisher Yu, Dequan Wang, Evan Shelhamer, Trevor Darrell"
  title:   "Deep Layer Aggregation"
  venue:   "CVPR 2018"
---

## Introduction

![](/article/images/deepAggregation/sc01.jpg)

Simple paper which revisits the well-known dense connections and feature aggregations typical of architectures like DenseNet and PyramidNet.

## Method

They proposed two new architectures : one for classification (fig.3) and one for segmentation (fig.4)
![](/article/images/deepAggregation/sc02.jpg)

![](/article/images/deepAggregation/sc03.jpg)

Note that the segmentation architecture is like a U-Net but with conv layers between the encoding and decoding layers.  The number of conv layers is inversely proportionnal to the depth of the layers. 


## Results

Without much surprise, the proposed architectures got quite good results on a variety of classification datasets (like imagenet in Fig.5) and segmentation datasets (like Cityscapes in table 4).


![](/article/images/deepAggregation/sc04.jpg)

 
![](/article/images/deepAggregation/sc05.jpg)




