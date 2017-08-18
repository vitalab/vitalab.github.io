---
layout: review
title:  "A-Fast-RCNN: Hard Positive Generation via Adversary for Object Detection"
tags:   deep-learning localization CNN GAN
author: Clément Zotti
pdf:   "https://arxiv.org/pdf/1704.03414.pdf"

cite:
  authors: "X. Wang, A. Shrivastava, A. Gupta"
  title:   "A-Fast-RCNN: Hard Positive Generation via Adversary for Object Detection"
  venue:   "CVPR 2017"
---

Paper :
   - [code](https://github.com/xiaolonw/adversarial-frcnn)

This papers train an adversarial network to generate occlusion/deformation/illumination changes to help an object detector network to generalize better.

As an object detector network they use [Faster-RCNN]({{ site.baseurl }}{% post_url /deep-learing/2017-05-14-fastrcnn %}).

# Model

The adversarial model has two part (Fig.), the first one is a spatial dropout occlusion, it generates occlusion maps on the object features after the ROI layer.
To select which pixel to mask, they use importance sampling on the mask and keep only the top $$ \frac{1}{3} $$ pixels.

The second part is a spatial transformer network, it generates deformation on the object features. The deformation is mostly focus on rotation, and they found that limiting the rotation is a key factor in their experiment to not have upside down rotation and fool the prediction network. The rotation limit is in between $$ -10^\circ $$ to $$ 10^\circ $$. The other details about the rotation is that they divide the feature maps into 4 blocks given the channel axis and apply different rotation for these blocks.

<div align="middle">
     <img src="/deep-learning/images/afrcnn/network.png"/>
</div>

# Results

They report result on [PASCAL VOC 2007](http://host.robots.ox.ac.uk/pascal/VOC/voc2007/) dataset
