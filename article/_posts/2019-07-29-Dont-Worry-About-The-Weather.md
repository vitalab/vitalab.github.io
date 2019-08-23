---
layout: review
title: Don't Worry About the Weather: Unsupervised Condition-Dependent Domain Adaptation
tags: deep-learning CNN segmentation domain-adaptation GAN unsupervised traffic
cite:
    authors: "Horia Porav, Tom Bruls, Paul Newman"
    title:   "Don't Worry About the Weather: Unsupervised Condition-Dependent Domain Adaptation"
    venue:   "Arxiv, submitted on 25 Jul 2019"
pdf: "https://arxiv.org/pdf/1907.11004"
---

# Introduction

This paper underligne the fact that perfermence degrades quickly when the input conditions change event a little. 
The authors present a domain adaptation system that uses light-weight input adapters to pre-processes input images, irrespective of their apparence, in a way that makes them compatible with *off-the-shelf* cumputer vision tasks that are trained only on inputs with ideal conditions. 


The paper show a hybrid method, where multi-modal data is generated in an unsupervised fashion with approximated ground truth, followed by supervised training of domain-adapters, for multiples computer vision tasks, using this generated data and approximated ground truth.


This approach as for goal to incrementally adapt to new, unseen domain.
So if the condition of the input images does not match one that the system has ben previosly trained on.
The unsupervised style transfer pipeline will select a model that is the closest to the current condition, clone it, and fine-tune this cloned model to be able to change the style of the reference sequence so that it matches the style of the current input images.
Thoses images will by used to train, in a supervised fashion, an additional condition-specific image adapter that will allow upstream computer vision tasks to perform well on the new input image condition.


The main contributions:

- Using cycle-consistency GANs to generate multicondition training data with approximated ground truth for a battery of *off-the-shelf* computer vision tasks.

- Training input image adaptors by using the *off-the-shelf* computer vision models to generate a supervisory signal.

- Enabling online learning of new, unseen domains by leveraging the unsupervised data generation pipeline along with domains on which the data generation models have already been trained.

- Showing that training multiple lightweight adapter modules is better than training monolithic computer vision models that are invariant to input distributions.


# Learning Condition-Dependent Representations

## Synthetic Multi-Condition Data

They select a reference sequence of images: daytime, clear, and overcast.
In addition, they join a number of traversals with difficult conditions: night, rain, snow, etc. 
Along with a cycle-consistency architecture GAN to train generative models that can apply style transfer to the reference condition in order to create a number of synthetic sequences that maintain the structure and geometry of the reference condition.

add loss ...

## Input Adapters

The second step in this approach is to use the data generated in the previous step to train a bank of adapters that preprocess the input images such that they follow a distribution similar to that of the training sets used to train the bank of tasks.

put image og the network

The adaptors input is a 3-channel RGB image, while the output is a 3-channel image compatible with the inputs of many well-known models (semantic segmentation, object detection, depth estimation etc).
This configuration provides a light-weight solution that is easy to train using labelled data, with reduced storage requirements and use a small amount of memory .

put loss for adapters

## Domain Classifier

put image of the classifier 

They employ a domain classifier $$D$$ to select the most suitable input adapter $$F_k$$ that enables optimal performance on the input images with the $$k^{th}$$ condition.
Given an input image $$I_A$$ and a domain label $$t$$, the goal is to find the parameters of the classifier $$D$$ that minimizes the cross-entropy between the output of the classifier and the target label $$t$$.

## Online Learning 

put image 5 

...

# Results

image + table II et III




Famous 2D image segmentation CNN made of a series of convolutions and
deconvolutions. The convolution feature maps are connected to the deconv maps of
the same size. The network was tested on the 2 class 2D ISBI cell segmentation
[dataset](http://www.codesolorzano.com/Challenges/CTC/Welcome.html).
Used the crossentropy loss and a lot of data augmentation.

The network architecture:
![](/article/images/MyReview/UNetArchitecture.png)

A U-Net is based on Fully Convolutional Networks (FCNNs)[^1].

The loss used is a cross-entropy:
$$ E = \sum_{x \in \Omega} w(\bold{x}) \log (p_{l(\bold{x})}(\bold{x})) $$

The U-Net architecture is used by many authors, and has been re-visited in
many reviews, such as in [this one](https://vitalab.github.io/article/2019/05/02/MRIPulseSeqGANSynthesis.html).

# References

[^1]: Jonathan Long, Evan Shelhamer, and Trevor Darrell. Fully convolutional
      networks for semantic segmentation (2014). arXiv:1411.4038.
