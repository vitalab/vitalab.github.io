---
layout: review
title: "Prototypical Networks for Few-shot Learning"
tags: deep-learning few-shot-learning 
author: "Pierre-Marc Jodoin"
cite:
    authors: "J. Snell, K.Swersky, R. Zemel"
    title:   "Prototypical Networks for Few-shot Learning"
    venue:   "NIPS 2017"
pdf: "http://papers.nips.cc/paper/6996-prototypical-networks-for-few-shot-learning.pdf"
---


<center><img src="/article/images/prototype-net/sc01.jpg" width="500"></center>

## Summary

This paper proposes *Prototypical Networks* for the problem of few-shot (and zero-shot) classification, where a classifier must generalize to new data given only a small number of examples of each class. Prototypical Networks learn a metric space in which classification can be performed by computing distances to prototype representations of each class.  The proposed method is relatively intuitive and surprisingly effective.


## Proposed method

In few-shot classification we are given a small support set of $$N$$ labeled examples $$ S = {(x_1,y_1), ... ,(x_N, y_N)}$$ where each $$x_i \in R^D$$ is the D-dimensional feature vector of an example and $$y_i$$ is the corresponding label.  $$S_k$$ denotes the set of examples labeled with class $$k$$.


<center><img src="/article/images/prototype-net/sc02.jpg" width="750"></center> 

<br>Note that in their implementation, $$f_\phi$$ is a four-layer CNN.

Interestingly, when the system uses an Euclidean distance $$d(.)$$ the system becomes a linear model as illustrated in Figure 1.


<center><img src="/article/images/prototype-net/sc04.jpg" width="650"></center> 

<br><br> The training algorithm is as follows:

<center><img src="/article/images/prototype-net/sc03.jpg" width="650"></center> 


<br><br>A real illustration of the resulting embedding of a propotype network is shown in Fig.2. 


<center><img src="/article/images/prototype-net/sc05.jpg" width="350"></center> 



## Results

The method was state of the art on several datasets back in 2017.

<center><img src="/article/images/prototype-net/sc06.jpg" width="650"></center> 
