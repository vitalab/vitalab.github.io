---
layout: review
title: "EfficientNet: Rethinking Model Scaling for Convolutional Neural Networks"
tags: CNN deep-learning
author: "Pierre-Marc Jodoin"
cite:
    authors: "Mingxing Tan, Quoc V. Le"
    title:   "EfficientNet: Rethinking Model Scaling for Convolutional Neural Networks"
    venue:   "Proceedings of Machine Learning Research, 2019"
pdf: "https://arxiv.org/pdf/1905.11946.pdf"
---



![](/article/images/efficientnet/sc02.jpg)

# Highlights


In this paper, the authors study model scaling and identify that carefully balancing network **depth**, **width**, and **resolution** can lead to better performance. 

They show that such balance balance can be achieved by  scaling each of them with **constant ratio**. Based on this observation, they propose a simple **compound scaling method** which amounts to a simple neural architecture search.



![](/article/images/efficientnet/sc02.jpg)
# Methods

The authors consider the following three elements of a neural network (c.f.Fig.2):

* **Depth**: the number of layers.  
* **Width**: the number of neurons (and feature maps) at each layer
* **resolution** : the size of the input image.  

Acknowledging the fact that these variables are somehow connected to each other (e.g in a ConvNet, increasing resolution will affect the depth) 
they propose the following compound coefficient $$ \phi $$

![](/article/images/efficientnet/sc03.jpg)

# Results

![](/article/images/efficientnet/sc04.jpg)
![](/article/images/efficientnet/sc05.jpg)


Code is available here: []()

