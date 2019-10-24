---
layout: review
title: "Boundary-aware Instance Segmentation"
tags: deep-learning CNN instance-segmentation
author: Frédéric Branchaud-Charron
cite:
    authors: "Z. Hayder, X. He and M. Salzmann"
    title:   "Boundary-aware Instance Segmentation"
    venue:   "CVPR 2017"
pdf:   "https://infoscience.epfl.ch/record/227439/files/HayderHeSalzmannCVPR17.pdf"
---

In this paper, the authors propose a **boundary-aware** method which is resilient to error from the **region proposal network** (RPN). Most methods use a RPN to extract boxes and then estimate a binary mask to perform instance segmentation. Those methods suffer from the inaccuracy of the RPN.
To resolve this problem, the authors propose a new representation which is based on the distance between the pixel and the nearest boundary.

<div align="middle">
  <img src="/article/images/boundary-aware/annotation.jpg" width="200">
</div>

## Pipeline

First, they predict the boxes using an RPN. After ROI Warping, they predict a mask larger than the box. The mask is using the representation explained before.

Using the mask and the box, they predict the class before computing the loss.

 <div align="middle">
   <img src="/article/images/boundary-aware/model.jpg" width="600">
 </div>


The authors can retrieve the object by doing an inverse-distance transform on the prediction from the *Object Mask Network*.



# Results

The network is quite big and slow compared to the previous SotA (78ms versus 42 for MNC [^1]).
While the idea is interesting, the results are quite the same as MNC on PASCAL VOC 2012.

<div align="middle">
  <img src="/article/images/boundary-aware/pascal_res.jpg" width="300">
</div>

They did try the model on the Cityscapes dataset, but they did not get good result. (17.4% AP versus 32% for Mask R-CNN)


[^1] J. Dai, K. He, and J. Sun. Instance-aware semantic segmentation via multi-task network cascades. In CVPR, 2016
