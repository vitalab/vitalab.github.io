---
layout: review
title: "Novel deep learning-based method for prostate segmentation in T2-weighted
magnetic resonance imaging"
tags: medical MRI segmentation deep-learning
author: "Pierre-Marc Jodoin"
cite:
    authors: "Davood Karimi, Golnoosh Samei, Yanan Shao, Tim Salcudean"
    title:   "Novel deep learning-based method for prostate segmentation in T2-weighted              magnetic resonance imaging"
    venue:   "https://arxiv.org/abs/1901.09462"
pdf: "https://arxiv.org/pdf/1901.09462.pdf"
---

## Summary

This paper presents a simple but apparently affective method for segmenting prostate MRI images.  As illustrated in fig.1, they use 2 CNNs.  The first **global** one roughly segments the prostate.  Based on that segmentation, they crop the image and feed it to a second **local** CNN.  The resulting segmentation map is then post-processed with basic morphological operations.

> ![](/medical-imaging/images/proSeg/sc02.png)

**NOTE** that their CNNs are UNet are some sort of denseNets with residual modules.

> ![](/medical-imaging/images/proSeg/sc01.png)





## Results

Results on the PROMISE12 challenge dataset seams good. 

> ![](/medical-imaging/images/proSeg/sc03.png)
