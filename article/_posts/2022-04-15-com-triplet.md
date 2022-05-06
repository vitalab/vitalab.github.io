---
layout: review
title: "ComTriplet: Deep Clustering via Center-Oriented Margin Free-Triplet Loss for Skin Lesion Detection in Highly Imbalanced Datasets"
tags: representation-learning
author: "Pierre-Marc Jodoin"
cite:
    authors: "Şaban Öztürk, Tolga Çukur"
    title:   "Deep Clustering via Center-Oriented Margin Free-Triplet Loss for Skin Lesion Detection in Highly Imbalanced Datasets"
    venue:   "arXiv:2204.02275"
pdf: "https://arxiv.org/pdf/2204.02275.pdf"
---

# Introduction

This paper presents an updated version of the seminal **triplet loss**.  Their proposed loss is called *center-oriented
margin-free triplet loss* (or **COM-Triplet**). It has the following two main characteristics: 

* it comes with an adaptative margin
* the proposed loss considers the distance between Positive and Negative points

They also show how to use their loss on unlabelled data.  They tested their method on skin lesion images.

# Method

<center><img src="/article/images/comtriplet/sc01.jpg" width="500"></center>

The idea behind the COM-Triplet loss is well illustrated in the previous figure.  Instead of only considering the pair-wise distances between an anchor point and a positive and negative point as in the original triplet loss 

<center><img src="/article/images/comtriplet/sc02.jpg" width="350"></center>

where $$\alpha$$ is a fixed margin, they also account for the distance between the positive and the negative points which should be larger than between the positive and the anchor points:

<center><img src="/article/images/comtriplet/sc03.jpg" width="350"></center>

where $$Dist_{wa}$$ stands for the *within-* and *across-cluster* distance defined as

<center><img src="/article/images/comtriplet/sc04.jpg" width="350"></center>

I also like the idea that the margin has been made adaptive by setting it to be the opposite of the positive-negative distance:

<center><img src="/article/images/comtriplet/sc05.jpg" width="200"></center>

## Unsupervised clustering

![Figure 1](/article/images/comtriplet/sc06.jpg)

For the triplet loss to work, data has to be labelled as **positive** and **negative**.  So, in case one has to deal with unsupervised data, the authors propose to use a Gaussian Mixture Model to automatically assign labels.  This leads to a "Soft" version of their COM-Triplet.  See paper for more details.

# Results
The method was tested on the ISIC2020 skin lesion classification dataset.  The most appealing results are those reported in Table II (supervised classification), Table III (unsupervised classification) and Figure 4 which shows that the COM-Triplet is more robust to class imbalance than a VGG classifier.

![Results 1](/article/images/comtriplet/sc07.jpg)
![Results 2](/article/images/comtriplet/sc08.jpg)
![Results 3](/article/images/comtriplet/sc09.jpg)

# Reference

Nice blog on the triplet loss : [https://towardsdatascience.com/triplet-loss-advanced-intro-49a07b7d8905](https://towardsdatascience.com/triplet-loss-advanced-intro-49a07b7d8905)
