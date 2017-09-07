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

![](/deep-learning/images/episodic-camn/figure1.png)

The proposed model is a Fully Convolutional Network (FCN) with soft attention on the patch representations (Contextual Attention-based Memory Network, or CAMN). The attention network iteratively refines its output using an RNN, which makes it an Episodic-CAMN.

Basically, the model is VGG + Recurrent soft attention inserted between FC6 and FC7.

![](/deep-learning/images/episodic-camn/figure2.png)


## Experiments and Results

**Datasets:** 
- PASCAL-Context
- SIFT Flow
- PASCAL VOC 2011

They only compare with VGG-based networks with similar settings.


![](/deep-learning/images/episodic-camn/figure3.png)

![](/deep-learning/images/episodic-camn/figure4.png)

![](/deep-learning/images/episodic-camn/figure5.png)

![](/deep-learning/images/episodic-camn/figure6.png)

![](/deep-learning/images/episodic-camn/table1.png)

![](/deep-learning/images/episodic-camn/table2.png)

