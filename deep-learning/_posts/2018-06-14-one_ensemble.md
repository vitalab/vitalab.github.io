---
layout: review
title:  "Knowledge Distillation by On-the-Fly Native Ensemble"
tags:   Deep Learning
author: Faezeh Amjadi
pdf:    https://arxiv.org/abs/1806.04606
cite:
  authors: "Xu Lan, Xiatian Zhu, Shaogang Gong"
  title:   "Knowledge Distillation by On-the-Fly Native Ensemble"
  venue:   "arxiv"
---

### Description


Knowledge Distillation normally works with two networks, while these days trying to bring it to a network end to end like Snapshot Ensemble model. In this work, The authors employ a network model with branch like Resnet(a category of two branch
network where one branch is the identity mapping) which in high-level layers, they design a multi-branch as ensemble models and features are largely shared across different branches in low-level layers. 



<img src="/deep-learning/images/one_ensemble/0.png" width="400">




<img src="/deep-learning/images/one_ensemble/00.png" width="800">






A gate component which learns to ensemble all branches to build a stronger teacher model simultaneously. Then they don't need a pre-train teacher. The gate is constructed by one FC layer followed by
batch normalization, ReLU activation, and softmax, and uses the same input features as the branches. The task of the gate is the importance score to the i-th branch’s logits and then sum over them as an ensemble model.

<img src="/deep-learning/images/one_ensemble/1.png" width="200">


Cross-entropy loss is applied to the teacher and students. For facilitating knowledge transfer from teacher back into all branches, teacher and students logits are computed as a soft probability distribution in their predictions and then use Kullback Leibler divergence to quantify the alignment between individual branches and the teacher. 

<img src="/deep-learning/images/one_ensemble/2.png" width="400">

Finally loss has three components:

<img src="/deep-learning/images/one_ensemble/3.png" width="300">



### Experiments
The E-one denotes an ensemble with all trained branches. 



<img src="/deep-learning/images/one_ensemble/4.png" width="800">

<img src="/deep-learning/images/one_ensemble/5.png" width="800">






