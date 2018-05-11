---
layout: review
title:  "Adaptive Cost-sensitive Online Classification"
tags:   machine-learning, classification
author: "Charles Authier"
pdf: "https://arxiv.org/pdf/1804.02246"
cite:
    authors: "Peilin Zhao, Yifan Zhang, Min Wu, Steven C. H. Hoi, Mingkui Tan, Junzhou Huang"
    title:   "Adaptive Cost-sensitive Online Classification"
    venue:   "https://arxiv.org/pdf/1804.02246"
---

## Intro
They proposed three algorithms and validate their effectiveness and properties for solving cost-sensitive online classification problems.
They approximate the second covariance matrix Σ by a small number of carefully selective directions.
That technique is called *sketch*, which significantly accelerates the computational speed with little performance losses.
## Algorithms

![](/machine-learning/images/acog/algo1.png){:height="300" width="450px"}

![](/machine-learning/images/acog/algo2.png){:height="400" width="450px"}

![](/machine-learning/images/acog/algo3.png){:height="400" width="450px"}

![](/machine-learning/images/acog/algo4.png){:height="400" width="450px"}

## Results

![](/machine-learning/images/acog/results_bi.png)

![](/machine-learning/images/acog/results_.png)
