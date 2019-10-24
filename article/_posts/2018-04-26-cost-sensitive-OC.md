---
layout: review
title:  "Adaptive Cost-sensitive Online Classification"
tags:   machine-learning machine-learning, classification
author: "Charles Authier"
pdf: "https://arxiv.org/pdf/1804.02246"
cite:
    authors: "Peilin Zhao, Yifan Zhang, Min Wu, Steven C. H. Hoi, Mingkui Tan, Junzhou Huang"
    title:   "Adaptive Cost-sensitive Online Classification"
    venue:   "https://arxiv.org/pdf/1804.02246"
---

## Intro
They proposed three algorithms and validate their effectiveness and properties for solving cost-sensitive online classification problems. In the real world, a cost-sensitive classification problem can be very different from the regular classification one and can be used by applications like targeted marketing, information retrieval, medical decision making, object recognition and intrusion detection.

The first approach of the Adaptive Regularized Cost-Sensitive Online Gradient Descent algorithms (named ACOG), has one limitation that it will take a large amount of time when receiving quite high-dimensional samples. To better balance the performance and the running time, they propose an enhanced version of algorithms, named Sketched Adaptive Regularized Cost-Sensitive Online Gradient Descent (SACOG).

They approximate the second covariance matrix Σ by a small number of carefully selective directions.
That technique is called *sketch*, which significantly accelerates the computational speed with little performance losses.
The enhanced version of ACOG via sketch method is designed to accelerate computation efficiency when the second order matrix of sequential data is low rank. They use that second covariance matrix instances of full-matrix that have low effective rank. The regret bound of diagonal ACOG may be much worse than its full-matrix version due to the lack of enough dependence on the data dimensionality.

## Algorithms

![](/article/images/acog/algo1.jpg){:height="300" width="450px"}

![](/article/images/acog/algo2.jpg){:height="400" width="450px"}

![](/article/images/acog/algo3.jpg){:height="400" width="450px"}

![](/article/images/acog/algo4.jpg){:height="400" width="450px"}

## Results

![](/article/images/acog/results_bi.jpg)

![](/article/images/acog/results_.jpg)
