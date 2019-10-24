---
layout: review
title:  "Learning a Discriminative Feature Network for Semantic Segmentation"
tags:   deep-learning Segmentation CNN
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1804.09337.pdf
cite:
  authors: "Changqian Yu, Jingbo Wang, Chao Peng, Changxin Gao, Gang Yu, Nong Sag"
  title:   "Learning a Discriminative Feature Network for Semantic Segmentation"
  venue:   "CVPR 2018"
---


### Description

<center><img src="/article/images/DFN/sc01.jpg" width="400"></center>


Semantic segmentation methods often suffer from two problems: **intra-class inconsistency** and **inter-class indistinction** (c.f.Fig.1). To tackle these two problems,
they propose a Discriminative Feature Network (DFN), which contains two sub-nets: a **Smooth Network** and a **Border Network** (c.f.Fig.2)


<center><img src="/article/images/DFN/sc02.jpg" width="700"></center>



## Smooth Network

The smooth network is designed to address the intra-class inconsistency issue. It is like a U-Net by with Channel Attention Blocks (CAB) (c.f. Fig.3), which utilizes the high-level features to guide the selection of low-level features stage-by-stage.  They also use a Refinement Residual Block (RRB) which is a fancy residual block.  This network is trained with a usual *cross-entropy*.


<center><img src="/article/images/DFN/sc03.jpg" width="400"></center>

## Border Network

The Border Network, on the other hand, tries to differentiate
the adjacent patches with similar appearances but different
semantic labels.  It does so by by predicting objects boudaries.  To account for the strong class imbalance (there is much less border pixels than non-border pixels) this network is trained with a *focal loss*.  The resulting loss is:

<center><img src="/article/images/DFN/sc04.jpg" width="400"></center>



### Results

This method is state-of-the-art on **Pascal VOC** and **Cityscapes**

<center><img src="/article/images/DFN/sc05.jpg" width="400"></center>
<center><img src="/article/images/DFN/sc06.jpg" width="400"></center>
<center><img src="/article/images/DFN/sc07.jpg" width="400"></center>


