---
layout: review
title: "PixelSNAIL: An Improved Autoregressive Generative Model"
tags: deep-learning RNN
author: "Philippe Poulin"
cite:
    authors: "Chen, X., Mishra, N., Rohaninejad, M. and Abbeel, P."
    title:   "PixelSNAIL: An Improved Autoregressive Generative Model"
    venue:   "ICML2018"
pdf: "http://proceedings.mlr.press/v80/chen18h/chen18h.pdf"
---

**Code:** <https://github.com/neocxi/pixelsnail-public>

## Summary

PixelSNAIL is an autoregressive generative model:

> ![](/article/images/pixel-snail/autoregressive.png)

In this case, $$ (x_1, ..., x_n) $$ are the pixels of an image.

**Advantages of using an autoregressive generative model:**

- Tractable likelihood and easy training (as opposed to GANs)
- Outperforms latent variable models

**Possible conditional models, and why they don't work:**

- Traditional RNNs suffer from really long-range dependencies
- Causal convolutions (see PixelCNN) have a finite size receptive field
- Self-attention (Attention Is All You Need/Transformer) requires keeping access to all previously generated elements


Choosing an ordering for the pixels is an arbitrary choice. Usually, a raster scan is chosen :

> ![](/article/images/pixel-snail/figure1.png)

For example, causal convolutions (PixelCNN) are designed using a raster scan ordering : 

> ![](/article/images/pixel-snail/figure2.png)

The idea of PixelSNAIL is to combine a residual block and  a self-attention block.

> ![](/article/images/pixel-snail/figure4.png)

> ![](/article/images/pixel-snail/figure5.png)

Receptive field for a randomly initialized model (Derivative of the predicted yellow pixel w.r.t the input):

> ![](/article/images/pixel-snail/figure6.png)
> ![](/article/images/pixel-snail/figure7.png)
> ![](/article/images/pixel-snail/figure8.png)

## Results

They compare results with other tractable likelihood methods on CIFAR-10, ImageNet 32x32 and ImageNet 64x64.

> ![](/article/images/pixel-snail/table1.png)

> ![](/article/images/pixel-snail/figure10.png)

> ![](/article/images/pixel-snail/figure11.png)
