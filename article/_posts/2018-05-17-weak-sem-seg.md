---
layout: review
title:  "Revisiting Dilated Convolution: A Simple Approach for Weakly- and Semi- Supervised Semantic Segmentation"
tags:   deep-learning segmentation
author: Frédéric Branchaud-Charron
pdf:    https://arxiv.org/abs/1805.04574
cite:
  authors: "Yunchao Wei, Huaxin Xiao, Honghui Shi, Zequn Jie, Jiashi Feng, Thomas Huang"
  title:   "Revisiting Dilated Convolution: A Simple Approach for Weakly- and Semi- Supervised Semantic Segmentation"
  venue:   "CVPR 2018"
---


The authors propose using dilated convolutions for weakly-supervised semantic segmentation.
In particular, they designed their method for when we only have the image labels.

As we can see below, the dilated convolution allows to transfer informations to neighboring pixels.

![](/article/images/weak-sem-seg/fig2.jpg)

The model is describe below, it takes the features maps from a classification network and then use several dilation schemes to extract features.


![](/article/images/weak-sem-seg/fig1.jpg)


The final segmentation map is $$H = H_0 + \frac{1}{n_d} \sum_{i=0}^{n_d}H_i$$ where $$H_0$$ is the output without dilation and $$n_d$$ is the number of dilation scheme.

To train the network, they compare $$H$$ to the output of a saliency detector.
---
By adding a CRF at the end, they get SotA results on Pascal.

![](/article/images/weak-sem-seg/table2.jpg)
---

By training their network with 2.9k **strong** samples (ie. samples fully-annotated) they can get much better results.

![](/article/images/weak-sem-seg/table4.jpg)
