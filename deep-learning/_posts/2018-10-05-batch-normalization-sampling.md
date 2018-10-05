---
layout: review
title: "Batch normalization sampling"
tags: deep-learning
author: "Antoine Théberge"
cite:
    authors: "Anonymous authors"
    title:   "Batch Normalization Sampling"
    venue:   "ICLR 2019 (under review)"
pdf: "https://openreview.net/forum?id=HkGsHj05tQ"
---

## The idea
Batch normalization works really well but is really slow even with parralel optimizations.

![](/deep-learning/images/batch_normalization_sampling/slow.png)

But the authors suggest that you can speedup the process but sampling only part of the batch and estimating mean and variance. Models C, D are Resnet-18 and Model E is Resnet-50

## The method

![](/deep-learning/images/batch_normalization_sampling/sampling.png)

Multiple samping methods are proposed, but the authors mostly used BS and FS. They also used Virtual Dataset Normalization where estimation is both done on virtual data and sampled data according to a predermined ratio.

## The results

![](/deep-learning/images/batch_normalization_sampling/converge.png)
![](/deep-learning/images/batch_normalization_sampling/accuracy.png)
![](/deep-learning/images/batch_normalization_sampling/speedup.png)


