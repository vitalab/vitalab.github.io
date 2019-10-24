---
layout: review
title:  "The Building Blocks of Interpretability"
tags:   deep-learning CNN
author: Pierre-Marc Jodoin
cite:
  authors: "
C Olah, A Satyanarayan, I Johnson, S Carter, L Schubert, K Ye, A Mordvintsev"
  title:   "The Building Blocks of Interpretability"
  venue:   "https://distill.pub/2018/building-blocks"
---

 This paper presents ways to visualize what a CNN detects and explain how it develops its understanding, while keeping the amount of information human-scale. For example, authors show how a network looking at a labrador retriever detects ﬂoppy ears and how that inﬂuences its classiﬁcation.

To understand this paper, you might want to read this paper first : [feature-visualization](https://distill.pub/2017/feature-visualization/)

## Visualization 2.0

Using GoogLeNet.  They show that instead of visualizing individual neurons, we can instead visualize the combination of neurons that fire at a given spatial location. 


![](/article/images/interpretability/sc01.jpg)

Applying this technique to all the activation vectors allows us to not only see what the network detects at each position, but also what the network understands of the input image as a whole

![](/article/images/interpretability/sc02.jpg)

different layers

![](/article/images/interpretability/sc03.jpg)

with the magnitude of the activation 

![](/article/images/interpretability/sc04.jpg)

## How are concepts assembled?

Authors also give an alternate way to visualize saliency maps by considering channels instead of spatial locations. Doing so allows to perform channel attribution: how much did each detector contribute to the ﬁnal output?

![](/article/images/interpretability/sc05.jpg)
