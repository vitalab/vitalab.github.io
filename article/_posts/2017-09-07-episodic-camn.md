---
layout: review
title: "Episodic CAMN: Contextual Attention-based Memory Networks With Iterative Feedback For Scene Labeling"
tags: deep-learning CNN RNN segmentation
author: "Philippe Poulin"
cite:
    authors: "A. H. Abdulnabi, B. Shuai, S. Winkler, G. Wang"
    title:   "Episodic CAMN: Contextual Attention-based Memory Networks With Iterative Feedback For Scene Labeling"
    venue:   "CVPR 2017"
pdf: "http://vintage.winklerbros.net/Publications/cvpr2017.pdf"
---

## Summary

![](/article/images/episodic-camn/figure1.jpg)

The proposed model is a Fully Convolutional Network (FCN) with soft attention on the patch representations (Contextual Attention-based Memory Network, or CAMN). The attention network iteratively refines its output using an RNN, which makes it an Episodic-CAMN.

Basically, the model is VGG + Recurrent soft attention inserted between FC6 and FC7.

![](/article/images/episodic-camn/figure2.jpg)


## Experiments and Results

**Datasets:** 
- PASCAL-Context
- SIFT Flow
- PASCAL VOC 2011

They only compare with VGG-based networks with similar settings.


![](/article/images/episodic-camn/figure3.jpg)

![](/article/images/episodic-camn/figure4.jpg)

![](/article/images/episodic-camn/figure5.jpg)

![](/article/images/episodic-camn/figure6.jpg)

![](/article/images/episodic-camn/table1.jpg)

![](/article/images/episodic-camn/table2.jpg)

