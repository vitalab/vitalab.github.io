---
layout: review
title:  "Deep Complex Networks"
tags:   deep-learning CNN
author: "Pierre-Marc Jodoin"
pdf: "https://openreview.net/pdf?id=H1T2hmZAb"
cite:
  authors: "C Trabelsi, O Bilaniuk, Y Zhang, D Serdyuk, S Subramanian, J F Santos, S Mehri, N Rostamzadeh, Y Bengio, C J Pal"
  title:   "Network compression and speedup"
  venue:   "ICLR 2018"
---

# Introduction
In this paper, they show how to use complex numbers ($$a+bi$$ where $$i=\sqrt{-1}$$) in a deep neural network.

There are **two main motivations** to this work

1. Complex numbers, are numerically efficient and stable in the context of information retrieval from an associative memory
2. Using complex weights in neural networks also has biological motivation. The complex-valued formulation allows
one to express the neuron’s output in terms of its firing rate and the relative timing of its activity.
The amplitude of the complex neuron represents the former and its phase the latter


The main **contributions** of this paper are:

* New complex conv operation
* New ReLu-based activation functions
* New complex batch norm operation
* A state of the art result on the MusicNet multi-instrument music transcription dataset,
* A state of the art result in the Speech Spectrum Prediction task on the TIMIT dataset,

The main **drawbacks** of complex nets are:

* complex multiplication is 4 times more expensive than its real counterpart
* the real-valued model performs better in terms of accuracy for the image classification task

# How it works

The convolution is made like this 

![](/article/images/complexnet/sc07.jpg)

where the first feature maps are the **real** values and the last are the **complex** values.  They also propose two complex **relu** functions i.e.

![](/article/images/complexnet/sc05.jpg)

.
![](/article/images/complexnet/sc06.jpg)
 
And finally, they propose a new batch normalization 

![](/article/images/complexnet/sc08.jpg)
.
![](/article/images/complexnet/sc09.jpg)
.
![](/article/images/complexnet/sc10.jpg)

All of this is summarized here :


![](/article/images/complexnet/sc01.jpg)

# Results
In short : it doesn't work for image classification but does work for music and speech analysis.

![](/article/images/complexnet/sc02.jpg)
![](/article/images/complexnet/sc03.jpg)
![](/article/images/complexnet/sc04.jpg)


# Code

Code can be found [HERE](https://github.com/ChihebTrabelsi/deep_complex_networks)

