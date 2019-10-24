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

This paper presents a simple but apparently effective method for segmenting prostate MRI images.  As illustrated in fig.1, they use 2 CNNs.  The first **global** one roughly segments the prostate.  Based on that segmentation, they crop the image and feed it to a second **local** CNN.  The resulting segmentation map is then post-processed with basic morphological operations.

> ![](/article/images/proSeg/sc02.jpg)

**NOTE** that their CNNs are UNet are some sort of denseNets with residual modules.

> ![](/article/images/proSeg/sc01.jpg)





## Results

Results on the PROMISE12 challenge dataset seem good. 

> ![](/article/images/proSeg/sc03.jpg)
