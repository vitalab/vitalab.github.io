---
layout: review
title:  "TreeSegNet: Adaptive Tree CNNs for Subdecimeter Aerial Image Segmentation"
tags:   Segmentation CNN remote-sensing 
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1804.10879.pdf 
cite:
  authors: "Kai Yue, Lei Yang, Ruirui Li, Wei Hu, Fan Zhang, Wei Li"
  title:   "TreeSegNet: Adaptive Tree CNNs for Subdecimeter Aerial Image Segmentation"
  venue:   "arXiv:1804.10879"
---


### Description

In this paper, the authors present a technique to improve the segmentation accuracy of a deepUNet (a UNet with Res Connections).  The idea is to better disantangle classes that the UNet easily get confused with.
The proposed solution is called **TreeSegNet** which adopts an adaptive network to increase the classification rate at the
pixelwise level.


<center><img src="/deep-learning/images/treeSegNet/sc01.png" width="700"></center>

The overall method is summarized in Fig.1.  First, the method passes a deepUNet for segmentation.  Then, based on the confusion matrix of the UNet, a treeNetCNN is build and appended right after it.

## Building the CNN tree

The CNN tree is built  with the following 4 steps: 

1. Calculate the lower triangular matrix;
2. Build the undirected graph;
3. Run the iterated the TreeCutting operation;
4. Build the tree structure.

These operations are summarized in Fig.3.  Note that each node of that tree is a **ResNeXt block** as shown in Fig.4
<center><img src="/deep-learning/images/treeSegNet/sc02.png" width="500"></center>
<center><img src="/deep-learning/images/treeSegNet/sc03.png" width="400"></center>
 
 The intuition for the tree CNN is that the most easily confusing classes tend to choose the path that contains more neural layers and thus benefit from further feature extraction.

### Results

They tested their method on the well-known **Postdam remote-sensing dataset** and outperformed state-of-the-art methods, although by a tiny margin.


<center><img src="/deep-learning/images/treeSegNet/sc04.png" width="600"></center>
<center><img src="/deep-learning/images/treeSegNet/sc05.png" width="600"></center>
<center><img src="/deep-learning/images/treeSegNet/sc06.png" width="600"></center>


