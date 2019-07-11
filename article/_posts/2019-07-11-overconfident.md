---
layout: review
title: "Why ReLU Networks Yield High-Confidence Predictions Far Away From the Training Data and How to Mitigate the Problem"
tags: deep-learning 
author: "Pierre-Marc Jodoin"
cite:
    authors: "Matthias Hein, Maksym Andriushchenko, Julian Bitterwolf"
    title:   "Why ReLU Networks Yield High-Confidence Predictions Far Away From the Training Data and How to Mitigate the Problem"
    venue:   "CVPR 2019"
pdf: "https://arxiv.org/abs/1812.05720"
---


# Introduction
ReLU neural networks are known for being overconfident when predicting unrelated data.  As shown in the paper, this is due to the fact that the output of the network is piece-wise linear. 

![](/article/images/overconfidence/sc01.jpg)
![](/article/images/overconfidence/sc02.jpg)

While this problem cannot be solved per se, it can nonetheless be mitigated.

# Methods

The authors propose a method to enforce a uniform confidence for any point far away from the training data.  They do this with a so-called *Adversarial confidence enhanced training* (ACET)

![](/article/images/overconfidence/sc03.jpg)

where the first term is the usual cross-entropy and the second term is a penalty term based on random adversarial images $$Z$$ drawn from a noise distribution.  Illustration of these images for the training of CIFAR10 is as follows:


![](/article/images/overconfidence/sc04.jpg)


In the following image we see the effect of training on CIFAR10 and testing of SVHN.

![](/article/images/overconfidence/sc05.jpg)

as well as on the synthetic 2D example

![](/article/images/overconfidence/sc06.jpg)

# Limitations

The method is not void of limitations as the network is still overconfident *very far* away from the training data 

![](/article/images/overconfidence/sc07.jpg)


# Results

The proposed method is effective for various dataset combinations:

![](/article/images/overconfidence/sc08.jpg)



