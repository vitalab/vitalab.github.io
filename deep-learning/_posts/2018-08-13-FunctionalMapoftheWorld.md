---
layout: review
title:  "Domain Adaptive Segmentation in Volume Electron Microscopy Imaging"
tags:   deep-learning, segmentation, domain adaptation
author: Charles Authier
pdf:  https://arxiv.org/abs/1810.09734v1
cite:
  authors: "Joris Roels, Julian Hennies, Yvan Saeys, Wilfried Philips, Anna Kreshuk"
  title:   "Domain Adaptive Segmentation in Volume Electron Microscopy Imaging"
  venue:   "ISBI 2019 (under review)"
---

Code: https://github.com/JorisRoels/domain-adaptive-segmentation

## Method
The new method adds a reconstrcution decoder to the classical encoder-decoder segmentation in order to align source and target encoder features.

## Ynet
![](/deep-learning/images/ynet/ynet.png)

The method want to compensate the domain shift between source and target domain by introducing feature (distribution) similarity metrics.
They introducing a second decoder to the classical encoder-decoder setup which serves to reconstruct the input data which originates from both source and target domain.
The complete architecture is trained end-to-end with the following loss function:

![](/deep-learning/images/ynet/loss.png)

Where $$L_r$$ is the reconstruction loss function, in their case is a mean-squared error, $$\hat{x}^{s/t}$$ are reconstructions of the source/target inputs obtained by the auto-encoding sub-network.

The network is initially trained in an unsupervised fashion, after which the reconstruction decoder is discarded.

## Results

* FT: Finetuning baseline.
* MMD: Maximum mean discrepancy.
* Coral: Correlation difference.
* DANN: Distributions in an adversarial setup.

![](/deep-learning/images/ynet/table.png)

![](/deep-learning/images/ynet/results.png)
