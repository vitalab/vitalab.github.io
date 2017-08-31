---
layout: review
title: "Inverse Compositional Spatial Transformer Networks"
tags: deep-learning CNN RNN
author: "Faezeh Amjadi"
cite:
    authors: "Chen-Hsuan Lin and Simon Lucey"
    title:  "Inverse Compositional Spatial Transformer Networks" 
    venue:   "CVPR 2017"
pdf: "https://arxiv.org/pdf/1612.03897.pdf"
---
   
## Summary

The authors present a method to improve the robustness of a CNN to spatial variations. Instead of using a transformation nerwork [1] as in Fig.1 which tries to recover the warping function $$p$$ given the input image $$I_{in}$$, they implemented an iterative approach inspired by Lucas-Kanade optical flow algorithm. 

![](/deep-learning/images/icstn/sc.png)

The Lucas-Kanade algorithm tries to minimize the sum of squared differences
(SSD) objective $$ min_{\delta_p} ||I_{in}(p+\delta_p) - T(0)|| $$ where $$I_{in}$$ is the input image, $$p $$ is the transformation and $$T(0)$$ is a template image.  Since the Lucas-kanade algorithm is iterative ($$p=p+\delta_p$$), the proposed method implements a sequence of transformations networks.  So instead of trying to compute $$p$$ right away as for the STN, it computes a sequence of $$\delta_p$$.

![](/deep-learning/images/icstn/sc1.png)
 

The network in Fig.4 can be represented as a recurrent network

![](/deep-learning/images/icstn/sc2.png)


## Experiments and results

The authors show that the use of a recurrent transformation network gives better results while preventing from the boundary effect.

![](/deep-learning/images/icstn/sc3.png)

![](/deep-learning/images/icstn/sc4.png)

## Code

The code is available at [https://github.com/ericlin79119/IC-STN](https://github.com/ericlin79119/IC-STN). It uses Python/Tensorflow.

[1] M. Jaderberg, K. Simonyan, A. Zisserman, et al. Spatial transformer networks. In Advances in Neural Information Processing Systems, pages 2017–2025, 2015
