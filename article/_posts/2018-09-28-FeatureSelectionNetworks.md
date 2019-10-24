---
layout: review
title: "Feature Selective Networks for Object Detection"
tags: deep-learning detection attention-maps
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Yao Zhai and Jingjing Fu and Yan Lu and Huoqiang Li"
    title:   "Feature Selective Networks for Object Detection"
    venue:   "CVPR 2018"
pdf: "http://openaccess.thecvf.com/content_cvpr_2018/papers/Zhai_Feature_Selective_Networks_CVPR_2018_paper.pdf"
---

# Highlights
- Network generates region-orientated attention maps and creates an informative
translation-variant representation of RoI features.
- Simplified subnetwork to a single low-capacity FC layer, which largely reduces
parameter size and speeds up inference.
- Improved detection performance using ResNet-101, GoogLeNet and VGG-16code
backbones.

# Summary

The goal is to extract effective RoI features from translation-invariant
convolutional feature maps. A two-stage object detection framework that consists
of a proposal generator and a region classifier is used.

The paper proposes feature selective networks, which introduce dimension
reduction and region-wise feature attention. RoI features are extracted with
respect to the sub-region variation and aspect ratio preference.

![](/article/images/FeatureSelectiveNetworks/AttentionMapGeneration.jpg)

# Introduction
Most of state-of-the-art object detectors adopt two-stage framework composed of
a proposal generator and a region classifier. RoI features are extracted by
generating whole image feature maps by ConvNets, and then pooling the RoI
features.

Classical RoI pooling layer divides RoIs into pooling bins and max-pools.
RoI features originating from convolutional feature map are high-dimensional.

RoI features pooled by classical RoI pooling are translation-invariant, i.e.
insensitive to detection tasks. RoI features are extracted independently for
different sub-regions and aspect ratio.

# Methods
- Generate feature map using ConvNet (ImageNet pre-trained classification
backbones).
- Channel reduction using 1x1 convolution.
- Max-pool.
- Compute RoIs provided by Region Proposal Network (RPN).
- Generate sub-region attention maps using shifted convolutional layers on the
convolutional feature map of the entire image. For the same spatial position
inside different sub-region, the sub-region attention map gives different
feature attentions.
- Generate aspect ratio attention map for each RoI using a 1×1 convolutional
layer on the convolutional feature map. For the RoIs of different aspect ratios,
the aspect ratio attention map also produces distinct feature attentions.

- Selective RoI pooling.
- Detection subnetwork.

![](/article/images/FeatureSelectiveNetworks/Architecture.jpg)

| ![](/article/images/FeatureSelectiveNetworks/SubregionAttentionBanks.jpg)
| ![](/article/images/FeatureSelectiveNetworks/AspectRatioAttentionBanks.jpg) |



## Data
- PASCAL VOC 2007, VOC 2012
- MS COCO val2015

## Benchmarking
- Faster R-CNN
- R-FCN

# Results

![](/article/images/FeatureSelectiveNetworks/Results.jpg)
