---
layout: review
title: "Multigrid Neural Architectures"
tags: deep-learning CNN classification segmentation
cite:
  authors: "T. Ke, M. Maire,  S.X. Yu"
  title: "Multigrid Neural Architectures"
  venue: "CVPR 2017"
pdf: http://ttic.uchicago.edu/~mmaire/papers/pdf/nmg_cvpr2017.pdf
---

This paper presents a new way of using convolutions. They test their models for three different tasks namely, classification, semantic segmentation, and spatial transformation.

Rather than using a convolution on only one scale, they use multiple convolutions at each scale of the input. Each of these scales also contains information from the scales close to it.

<div align='middle'>
     <img src="/article/images/multigrid/layer.jpg" />
</div>


## Architectures

<div align='middle'>
     <img src="/article/images/multigrid/architectures.jpg" />
</div>

## Results

For the classification, they use CIFAR-100 dataset, for semantic segmentation they build a synthetic dataset based on MNIST, and for the spatial transformation they use the same synthetic dataset.


<div align='middle'>
     <img src="/article/images/multigrid/cifar100.jpg" />
     <img src="/article/images/multigrid/mnist-imagenet.jpg" />
</div>
