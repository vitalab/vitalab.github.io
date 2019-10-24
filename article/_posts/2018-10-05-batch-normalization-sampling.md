---
layout: review
title: "Batch normalization sampling"
tags: deep-learning optimization layers
author: "Antoine Théberge"
cite:
    authors: "Anonymous authors"
    title:   "Batch Normalization Sampling"
    venue:   "ICLR 2019 (under review)"
pdf: "https://openreview.net/forum?id=HkGsHj05tQ"
---

## The idea
Batch normalization works really well but is really slow even with parallel optimizations.

![](/article/images/batch_normalization_sampling/slow.jpg)

The authors suggest that you can speed up the process by sampling only part of the batch and estimating mean and variance. Models C, D are Resnet-18 and Model E is Resnet-50

## The method

![](/article/images/batch_normalization_sampling/sampling.jpg)

Multiple sampling methods are proposed, but the authors mostly used Batch Sampling (BS) and Feature Sampling (FS). See above image for the explanation of approaches. They also used Virtual Dataset Normalization where estimation is both done on virtual data and sampled data according to a predetermined ratio.

## The results

![](/article/images/batch_normalization_sampling/converge.jpg)
![](/article/images/batch_normalization_sampling/accuracy.jpg)
![](/article/images/batch_normalization_sampling/speedup.jpg)

From the above results, we can see that the model converges as fast as full batch normalization, with potential substantial speedup and negligible accuracy loss.

