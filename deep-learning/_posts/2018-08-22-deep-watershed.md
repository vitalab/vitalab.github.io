---
layout: review
title: "ResNet: Deep Residual Learning for Image Recognition"
tags: deep-learning CNN essentials classification
cite:
    authors: "K He, X Zhang, S. Ren, J. Sun"
    title:   "Deep Residual Learning for Image Recognition"
    venue:   "Proceedings of CVPR 2016, p.770-778"
pdf:   "https://arxiv.org/pdf/1512.03385.pdf"
---

 
The authors propose a novel idea to perform instance segmentation. Inspired by the well-known watershed algorithm, they train a neural network to perform the same task which is to output an energy map. The energy map is related to the distance between the pixel and the nearest boundary. 

The network includes two parts. First, the direction network (U-net) estimates the direction of $$u_p$$ which is the vector between the pixel and the nearest boundary. The second, the **Watershed Tranform Net** outputs the energy. 

The network takes as input the rgb image and a semantic segmentation map. The rgb image is then masked by the segmentation map. 

Using connected component analysis, the authors can then retrieve the instances. This method is state of the art on CityScapes by a large margin.

In this paper, the authors use PSPNet for the semantic segmentation. 