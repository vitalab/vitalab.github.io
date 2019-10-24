---
layout: review
title:  "[sketchRNN] A Neural Representation of Sketch Drawings"
tags:   deep-learning RNN VAE
author: Pierre-Marc Jodoin
pdf:    "https://arxiv.org/pdf/1704.03477.pdf"
cite:
    authors: "David Ha, Douglas Eck"
    title:   "A Neural Representation of Sketch Drawings"
    venue:   "ICLR 2018"
---

## Introduction


![](/article/images/sketchRNN/sc101.jpg)

In this paper, the authors present a conditional VAE capable of encoding and decoding manual sketches. The goal is to teach a machine to draw a sketch like a human would do. 

 A sketch is a list of points, and each point is a vector consisting of 5 elements: $$S_i=(\Delta x, \Delta y, p_1, p_2, p_3)$$ where $$(\Delta x, \Delta y)$$ is the offset wrt the previous point and $$(p_1, p_2, p_3)$$ are binary variables encoding the pen status (down, up, EndOfSketch).


## Proposed method

The method is illustrated in the top figure.  The encoder is a bidirectional RNN which generates a latent point, iid of a Gaussian distribution. The decoder is an RNN whose input is both the previous point $$S_i$$ and the latent vector $$Z$$ and the output is a GMM for $$(\Delta x, \Delta y)$$  


![](/article/images/sketchRNN/sc102.jpg)

and a Softmax categorical distribution for $$(p_1, p_2, p_3)$$.  The loss has the usual VAE shape, i.e. a reconstruction Loss plus a Kullback-Leibler Divergence
Loss.  The reconstruction loss has two terms namely


![](/article/images/sketchRNN/sc104.jpg)

At test time, they use a "temperature" variable $$\tau$$ to add more or less randomness to their method.

## Results

They first show how their method works without an encoder (so only training the decoder).  This leads to an unconditioned RNN generator. 

![](/article/images/sketchRNN/sc103.jpg)

They then show that their VAE can correct abnormalities.

![](/article/images/sketchRNN/sc105.jpg)

and interpolate between shapes

![](/article/images/sketchRNN/sc106.jpg)

Even more interesting, their system can predict a sketch from an incomplete sketch.

![](/article/images/sketchRNN/sc107.jpg)


You shall find more information on the follwing [BLOG](https://ai.googleblog.com/2017/04/teaching-machines-to-draw.html)  
