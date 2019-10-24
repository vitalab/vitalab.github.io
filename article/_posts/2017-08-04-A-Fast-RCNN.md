---
layout: review
title:  "A-Fast-RCNN: Hard Positive Generation via Adversary for Object Detection"
tags:   deep-learning localization CNN GAN classification detection
author: Clément Zotti
pdf:   "https://arxiv.org/pdf/1704.03414.pdf"

cite:
  authors: "X. Wang, A. Shrivastava, A. Gupta"
  title:   "A-Fast-RCNN: Hard Positive Generation via Adversary for Object Detection"
  venue:   "CVPR 2017"
---

Paper :
   - [code](https://github.com/xiaolonw/adversarial-frcnn)

This paper shows a way to train an adversarial network to generate occlusion/deformation changes to help an object detector network to generalize better.

As an object detector network they use [Faster-RCNN]({% post_url /article/2017-05-14-fastrcnn %}).

## Model

The adversarial model has two parts (Fig.4). The first one is a spatial dropout occlusion (ASDN), it generates occlusion maps on the object features after the ROI layer.
To select which pixel to mask, they use importance sampling on the mask and keep only the top $$ \frac{1}{3} $$ pixels.

The second part is a spatial transformer network (ASTN), it generates deformation on the object features. The deformation is mostly focused on the rotation. They found that limiting the rotation is a key factor in their experiment to not have upside down rotations and fool the prediction network. The rotation limit is in between $$ -10^\circ $$ to $$ 10^\circ $$. The feature maps are divided into 4 blocks along the channel axis and different rotations are applied on these blocks.

<div align="middle">
     <img src="/article/images/afrcnn/network.jpg"/>
</div>

## Training

They use a pre-trained Fast-RCNN network on ImageNet. The training is done in a staged manner. First, they train FRCNN on the new database for localization. After, they fix the weights of the detector and train the adversarial model to create occlusion or rotation. In the end, they train both models at the same time to improve the detector network.

## Results

They report results on three dataset: [PASCAL VOC 2007](http://host.robots.ox.ac.uk/pascal/VOC/voc2007/), [PASCAL VOC 2012](http://host.robots.ox.ac.uk/pascal/VOC/), and [MSCOCO](http://cocodataset.org).

![](/article/images/afrcnn/voc2007.jpg)

![](/article/images/afrcnn/voc2012.jpg)

