---
layout: review
title: "Multigrid Neural Architectures"
tags: deep-learning CNN segmentation
cite:
  authors: "T. Ke, M. Maire,  S.X. Yu"
  title: "Multigrid Neural Architectures"
  venue: "CVPR 2017"
pdf: http://ttic.uchicago.edu/~mmaire/papers/pdf/nmg_cvpr2017.pdf
---

This paper presents a new way of using convolution. They test their models for three differents task namely, classification, semantic segmentation, and spatial transformation.

Rather than using a convolution on only one scale they use multiple convolutions at each scale of the input. Each of these scales also contains information from the scales close to him.

<div align='middle'>
     <img src="/deep-learning/images/multigrid/layer.png" />
</div>


## Architectures

<div align='middle'>
     <img src="/deep-learning/images/multigrid/architectures.png" />
</div>

## Results

For the classification, they use CIFAR-100 dataset, for semantic segmentation they build a synthetic dataset based on MNIST, and for the spatial transformation they use the same synthetic dataset.


<div align='middle'>
     <img src="/deep-learning/images/multigrid/cifar100.png" />
     <img src="/deep-learning/images/multigrid/mnist-imagenet.png" />
</div>
