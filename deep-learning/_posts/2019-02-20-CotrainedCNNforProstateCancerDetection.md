---
layout: review
title: Co-trained convolutional neural networks for automated detection of prostate cancer in multi-parametric MRI
tags: deep-learning CNN MRI medical
author: "Audrey Duran"
cite:
    authors: "X.Yang, C. Liu, Z. Wang, J. Yang, H. Le Min, L. Wang, K.-T. (Tim) Cheng"
    title:   "Co-trained convolutional neural networks for automated detection of prostate cancer in multi-parametric MRI"
    venue:   "Medical Image Analysis 42 (2017), p.212–227"
pdf: "https://www.sciencedirect.com/science/article/pii/S1361841517301299/pdfft?md5=5fd9c93e45babad9eacb14d9cfa5dded&pid=1-s2.0-S1361841517301299-main.pdf"
---

## Summary

This paper presents an automated Prostate cancer (mentionned as PCa) detection system which can concurrently identify the presence of PCa in an image and localize lesions based on co-trained convolutional neural network (CNN) features and a single-stage SVM classifier. Each network is trained using images of a single modality (ADC or T2w) in a weakly-supervised manner (labels only indicate the presence of PCa without lesions' locations).


## Method

> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Fig1_Yang2017.png)

1. ADC and T2w images aligned (ADC on the reference T2w). Method Free Form Model based on mutual information maximization
2. Automatic detection of prostate region with simple regression CNN network. Cropped and intensities normalization
3. Each pair of aligned ADC and T2w is input in the CNN (architecture similar to GoogleNet)-> output cancer response map and a 2048 feature vector (1024 ADC + 1024 T2w concatenation). Cancer response map then converted into a scalar p = projected gap score = likelihood wether a 2D MRI slice contains PCa or not.
4. Post processing for PCa localization : feature vector of each slice is input into a SVM classifier (better results than softmax)

> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Fig4_Yang2017.png)
> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Fig5_Yang2017.png)

Mettre loss

## Contributions
1st work of PCa detection which performs multimodal fusion by co-training CNN features for both modalities, where the information of each modality is employed to guide the CNN feature learning of the other modality.

**gras**

## Experiments

- 160 patients : 72 Pca and 88 BPH
- images acquired on a 3T MRI
- reference : 2 experts manually outlined the region of interest for each positive patient on 5 T2w slices -> intersection of the 2 delineations
- evaluation metrics : FROC curve

**Copying task**
> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Fig8_Yang2017.png)
> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Fig9_Yang2017.png)
> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Table2_Yang2017.png)
> ![](/deep-learning/images/Co-trainedCNNforProstateCancerDetection/Table3_Yang2017.png)
