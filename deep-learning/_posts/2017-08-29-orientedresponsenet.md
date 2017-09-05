---
layout: review
title: "Oriented Response Networks"
tags: deep-learning CNN classification
cite:
  authors: "Y. Zhou, Q. Ye, Q. Qiu, J. Jiao"
  title: "Oriented Response Networks"
  venue: "CVPR 2017"
pdf: https://arxiv.org/pdf/1701.01833.pdf
---

## Model

This papers provide a new way to use convolutions. In conventional convolution neural network, the filters are invariant to translation,
with their techniques they are also invariant to rotation. This method is called Oriented Responde Network (ORN). The ORN is built on top of Active Rotatiing Filters (ARF).


### ARF

An ARF $$ \mathcal{F} $$ is a filter of size $$ W \times W \times N $$ where $$ N $$ is the number of rotation during the convolution. These produce a feature map of $$N-1$$ orientations.
The rotated variant of $$\mathcal{F}$$ called $$\mathcal{F}_\theta$$ are constructed in two step, coordinate rotation, and orientation spin.

![](/deep-learning/images/orn/arf.png)

To be efficient the coordinate rotation and orientation spin are calculated by the circular shift operator in the fourier domain.

### Oriented Response Convolution (ORConv)

The ORConv can be seen as a composition of the ARF $$ \mathcal{F} $$ and a N-channel input feature map $$ \mathcal{M} $$.
This combination is denoted as $$ \tilde\mathcal{M} = \mathbf{ORConv}(\mathcal{F}, \mathcal{M}) $$,
where $$ \tilde\mathcal{M} $$ are the output feature maps with $$ \mathcal{N} $$ orientation.

<div align="middle">
     <img src="/deep-learning/images/orn/orconv.png" />
     <img src="/deep-learning/images/orn/filter.png" />
</div>

### Rotation invariant Feature encoding

By default the feature maps of ORN are not rotation invariant. When the task need to be within-class rotation invariant they use two strategies, ORAlign and ORPooling.

Notation: $$ \hat\mathcal{M}\{i\}^{(d)} $$ where $$ i $$ is the i-th feature map of the ORConv layer, and $$ d $$ is the orientation.

#### ORAlign
The ORAlign simpy compute the dominant orientation $$ \mathcal{D} = \text{argmax}_d \hat\mathcal{M}\{i\}^{(d)} $$ and spin the feature by $$ -\mathcal{D}\frac{2\pi}{N} $$.

#### ORPooling

This pooling consists of simply extracting the maximum orientation of a given feature map $$ \text{max}(\hat\mathcal{M}\{i\}^{(d)}) $$

## Results

They built an MNIST dataset with rotation from $$ [-\frac{\pi}{2}, \frac{\pi}{2}] $$. They report results and show the feature encoding using tSNE for number that are similar, like $$ 6 $$ and $$ 9 $$.

![](/deep-learning/images/orn/mnist_rot.png)

<div align="middle">
     <img src="/deep-learning/images/orn/mnist_rot_feat.png">
</div>


They also report results on CIFAR10 dataset and produce better results with less parameters.

<div align="middle">
     <img src="/deep-learning/images/orn/cifar10.png">
</div>
