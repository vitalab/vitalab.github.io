---
layout: review
title:  "LCNN: Lookup-based CNN"
tags:   deep-learning CNN layers
author: Carl Lemaire
pdf:    "https://arxiv.org/pdf/1611.06473.pdf"
cite:
    authors: "Hessam Bagherinezhad, Mohammad Rastegari, Ali Farhadi"
    title:   "LCNN: Lookup-based Convolutional Neural Network"
    venue:   "CVPR 2017"
---

- Goal: efficiency.
- Fast inference and training
- linear combination of kernel parts
- Learn dictionary + linear combinations
- dict size -> efficiency/accuracy trade-off
- few-shot learning
- few-iteration learning

LCNN presents a novel layer that can replace any convolutional layer. The main thing is that a filter is constructed as a linear combination of parts in a dictionary.

# Filter Construction

Let's first define the 4 tensors that we'll need:

* $$ \bold{W} \in \mathbb{R}^{m \times k_w \times k_h} $$ is a filter, where $$ (k_w, k_h) $$ are its spatial dimensions and $$ m $$ is the number of channels in the input image.
* $$ \bold{D} \in \mathbb{R}^{k \times m} $$ is the dictionary. It contains $$ k $$ vectors of size $$ m $$. Those vectors will be combined to construct the filter (See Figure 1).
* $$ \bold{I} \in \mathbb{N}^{s \times k_w \times k_h} $$ is the _lookup indices_ tensor, where $$ s $$ is the number of elements in the linear combination.
* $$ \bold{C} \in \mathbb{R}^{s \times k_w \times k_h} $$ is the _coefficient_ tensor.

Then, we can formulate the construction as follows:

$$ \bold{W}_{[:,r,c]} = \sum_{t=1}^s \bold{C}_{[t,r,c]} \cdot \bold{D}_{[\bold{I}_{[t,r,c]},:]} $$

![Figure 1 and 2](/deep-learning/images/lookup-cnn/fig1.png)

# Fast Convolution using a Shared Dictionary

Now, let's imagine that our dictionary is in fact the weights of a 1x1 convolution layer: we thus have $$ k $$ filters of dimensions $$ (m, 1, 1) $$. By passing our input image $$ \bold{X} \in \mathbb{R}^{m \times w \times h} $$ through this 1x1 convolutional layer, we get $$ \bold{S} \in \mathbb{R}^{k \times w \times h} $$. With $$ \bold{I} $$ and $$ \bold{C} $$ in hand, we can compute the result of the convolution $$ \bold{X} * \bold{W} $$ for each filter, without really constructing any $$ \bold{W} $$. (See section 3.1.1 of paper.)

One problem arises from using indices to select values in tensors: it makes the network non-differentiable. During training, a trick is used to be able to backpropagate. For each filter $$ \bold{W} $$, a sparse tensor $$ \bold{P} \in \mathbb{R}^{k \times k_w \times k_h} $$ is constructed. In this tensor, elements at indices $$ \bold{I} $$ have values $$ \bold{C} $$. Then, we have that $$ \bold{X} * \bold{W} = \bold{S} * \bold{P} $$ for each $$ \bold{W}, \bold{P} $$ pair.