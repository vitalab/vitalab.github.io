---
layout: review
title:  "Attentive Generative Adversarial Network for Raindrop Removal from A Single Image"
tags:   Segmentation CNN
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1711.10098.pdf
cite:
  authors: "Rui Qian, Robby T. Tan, Wenhan Yang, Jiajun Su, and Jiaying Liu"
  title:   "Attentive Generative Adversarial Network for Raindrop Removal from A Single Image"
  venue:   "CVPR 2018"
---


### Description

This paper aims at removing raindrops from color images.  It does so with a GAN framework i.e.: with a generative network that generates an image void of raindrops and a discriminative network that tries to differentiate between fake and real images.  C.f. Fig.2.   Most of the contribution of the paper lies in the generative network.

<center><img src="/deep-learning/images/raindrops/sc01.png" width="800"></center>


## The generative network

The first section of the generative network is a recurrent network (with LSTM) that aims at localizing raindrops.  It does so by iteratively predicting attention maps (c.f. fig.3).  

Once the attention map have been estimated, it is fed to an autoencoder together with the input image.  The output of the decoder is the expected image.  More details on the auto-encoder is shown in Fig.4

<center><img src="/deep-learning/images/raindrops/sc02.png" width="700"></center>
<center><img src="/deep-learning/images/raindrops/sc03.png" width="600"></center>

The resulting loss contains 4 terms:

<center><img src="/deep-learning/images/raindrops/sc05.png" width="400"></center>

 a GAN loss, an attention loss (to force the attention map A to look like the groundtruth mask of the drop M), a multiscale loss and a perceptual loss.  The perceptual loss is an L2 norm between the VGG code of the predicted image O and the groundtruth image T.


### Results

The method rocks!
<center><img src="/deep-learning/images/raindrops/sc06.png" width="800"></center>



