---
layout: review
title: "Gated Feedback Refinement Network for Dense Image Labeling"
tags: deep-learning segmentation
author: "Clément Zotti"
cite:
    authors: "M-A. Islam, M. Rochan, N-D-B. Bruce, Y. Wang"
    title: "Gated Feedback Refinement Network for Dense Image Labeling"
    venue: "CVPR 2017"
    
pdf: "http://www.cs.umanitoba.ca/~ywang/papers/cvpr17.pdf"
---

## Model

This paper is a follow up of [Label Refinement Network](https://arxiv.org/pdf/1703.00551v1.pdf).
The model is based on a encoding-decoding architecture with skip connections, the encoding is done by a VGG-16 network where only the convolutional layers are used.
The novelty of their work is the use of a gating mechanism in the skip connection.

![](/article/images/gfrn/fig2.jpg)

As you can see they use multiple crossentropy losses for each resolution of feature maps on the decoding part. This help the network to extract better information at each resolution.

## Gate Refinement unit

The **Gate unit** merges two resolution of feature maps by upsampling the lower resolution and make an element wise product of the features. These features are finally handled by the **Refinement unit** that produces a label segmentation map.

The main idea behind this is that lower resolution label maps integrate higher-frequency details from the skip connections and that lead to better segmentation maps.

![](/article/images/gfrn/fig3.jpg){: style="width: 365px"}
![](/article/images/gfrn/fig4.jpg){: style="width: 365px"}

## Results

They test their method on three datasets namely, CamVid, Pascal VOC 2012, and a subset of Pascal VOC 2012 with only horses and cows where the task is to separate each part of the animal.

#### CamVid
![](/article/images/gfrn/tab1.jpg){: style="width: 730px"}

#### PASCAL VOC 2012
![](/article/images/gfrn/tab3.jpg){: style="width: 730px"}

#### HORSE-COW
![](/article/images/gfrn/tab4.jpg){: style="width: 730px"}

