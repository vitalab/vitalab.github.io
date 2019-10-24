---
layout: review
title: "Deep Watershed Transform for Instance Segmentation"
tags: deep-learning CNN instance-segmentation
author: Frédéric Branchaud-Charron
cite:
    authors: "Min Bai and Raquel Urtasun"
    title:   "Deep Watershed Transform for Instance Segmentation"
    venue:   "CVPR 2017"
pdf:   "http://openaccess.thecvf.com/content_cvpr_2017/papers/Bai_Deep_Watershed_Transform_CVPR_2017_paper.pdf"
---


The authors propose a novel idea to perform instance segmentation. Inspired by the well-known watershed algorithm, they train a neural network to perform the same task which is to output an energy map. The energy map is related to the distance between the pixel and the nearest boundary.

The network includes two parts. First, the direction network (U-net) estimates the direction of $$ u_p $$ which is the vector between the pixel and the nearest boundary. The second, the **Watershed Tranform Net**, outputs the energy.

The network takes as input the RGB image and a semantic segmentation map. The RGB image is then masked by the segmentation map before being fed to the network.

Using connected component analysis, the authors can then retrieve the instances.

In this paper, the authors used PSPNet for the semantic segmentation.

![](/article/images/deep-watershed/model.jpg)
