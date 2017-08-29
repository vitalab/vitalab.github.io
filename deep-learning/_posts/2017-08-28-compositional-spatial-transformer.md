---
layout: review
title: "Inverse Compositional Spatial Transformer Networks"
tags: deep-learning CNN
author: "Pierre-Marc Jodoin"
cite:
    authors: "Chen-Hsuan Lin and Simon Lucey"
    title:  "Inverse Compositional Spatial Transformer Networks" 
    venue:   "CVPR 2017"
pdf: "Inverse Compositional Spatial Transformer Networks"
---
   
## Summary

The authors present a method to improve the robustness of a CNN to spatial variations. Instead of using a transformation nerwork [1] as in Fig.1 which tries to recover the proper warping function $$p$$ given the input image I, they implemented an iterative approach inspired by Lucas-Kanade optical flow algorithm. 

![](/deep-learning/images/icstn/sc.png)

The Lucas-Kanade algorithm tries to minimize the sum of squared differences
(SSD) objective $$ min_{\delta_p} ||I(p+\delta_p) - T(0)|| $$ where $$I$$ is the input image, $$p $$ is the transformation and $$T(0)$$ is a template image.  Since the Lucas-kanade algorithm is iterative ($$p=p+\delta_p$$), the proposed method implements a sequence of transformations networks.

![](/deep-learning/images/icstn/sc1.png)
 
which can be represented as a recurrent network

![](/deep-learning/images/icstn/sc2.png)


## Experiments and results

![](/deep-learning/images/icstn/sc3.png)



[1] M. Jaderberg, K. Simonyan, A. Zisserman, et al. Spatial transformer networks. In Advances in Neural Information Processing Systems, pages 2017–2025, 2015
