---
layout: review
title: "[Contrastive Loss] Dimensionality Reduction by Learning an Invariant Mapping"
tags: deep-learning essentials
author: "Pierre-Marc Jodoin"
cite:
    authors: "Raia Hadsell, Sumit Chopra, Yann LeCun"
    title:   "Dimensionality Reduction by Learning an Invariant Mapping"
    venue:   "CVPR 2006"
pdf: "https://arxiv.org/pdf/1708.02383v1.pdf"
---



## Summary

The contrastive loss is a **distance-based loss** as opposed to more convential **error-prediction losses**.  This loss is used to learn embeddings in which two similar points have a low Euclidean distance and two dissimilar points have a large Euclidean distance. 


## Proposed method

Formally, if we consider $$\vec X$$ as the input data and $$G_W(\vec X)$$ the output of a neural network, the inter-point distance is given by


<center><img src="/deep-learning/images/contrastiveLoss/sc01.png" width="300"></center>

The contrastive loss is simply
<center><img src="/deep-learning/images/contrastiveLoss/sc02.png" width="400"></center>

where $$Y=0$$ when $$X_1$$ and $$X_2$$ are similar and $$Y=1$$ otherwise, and $$L_S$$ is a loss for similar points and $$L_D$$ is a loss for dissimilar points.  More formally, the contrastive loss is given by

<center><img src="/deep-learning/images/contrastiveLoss/sc03.png" width="400"></center>

where $m$ is a predefined margin.  The gradient is given by the simple equations:

<center><img src="/deep-learning/images/contrastiveLoss/sc04.png" width="150"></center>
<center><img src="/deep-learning/images/contrastiveLoss/sc07.png" width="200"></center>

## Results

Results are quite convincing.

<center><img src="/deep-learning/images/contrastiveLoss/sc05.png" width="400"></center>

## Blog

A [nice blog](https://jdhao.github.io/2017/03/13/some_loss_and_explanations/) on the contrastive loss (and other losses).

