---
layout: review
title:  "Star shape Prior"
tags:   deep-learning CNN segmentation
author: Sarah Leclerc
pdf:   https://arxiv.org/pdf/1806.08437.pdf
cite:
  authors: "Zahra Mirikharaji, Ghassan Hamarneh"
  title:   "Star Shape Prior in Fully Convolutional Networks fot Skin Lesion Segmentation"
  venue:   "MICCAI 2018"
---


The authors suggest that the classical approach of using only data fidelity term to train CNN is insufficient. 

Inspired by past work on energy functional minimization techniques (ASM, graph-based methods ...), they propose to adapt Veksler star shape prior as a loss term.

### Star shape Prior

The idea is to penalize predictions that wouldn't amount to a star shaped object. 

"Assuming c is the center of object O, object O is a star shape object if, for any point p interior to the object, all the pixels q lying on the straight line segment connecting p to the object center c are inside the object".

![](/article/images/star-prior/prior.jpg)

Here is the expression of the new loss term that they combine to a binary cross entropy loss :

![](/article/images/star-prior/loss.jpg)

Basically, it enforces that with p and q any incident pixel on line l_pc, c being the groundtruth center, q should have the same label as p if they have the same grountruth labels and if p is assigned to the wrong class. Discontinuities of pixel labels on l_pc are only allowed on lesion boundaries and if the givel label is true.

---

### Experiments

They use two CNN architectures : U-Net and ResNet-DUC (Res-Net-152 pretrained on ImageNet).

They apply this  on the Skin Lesion Analysis Towards Melanoma Detection Challenge (ISBI 2017), composed of 2000 (train) + 150 (valid) + 600 (test) images. Only 0.14% of the groundtruths skin lesions are not star-shaped.

They add the second term loss after 5 epochs. In practice, they only consider the m closest pixels to p on d directions (m = 6, d = 8).

Here are the Jaccard index results :

![](/article/images/star-prior/res.jpg)

For each experiment, they also computed a non-parametric Wilcoxon test that showed that the networks with and without the prior are statistically different at p < 0.05.

Here is a visualization of the results : 

![](/article/images/star-prior/visuals.jpg)