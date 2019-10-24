---
layout: review
title: Multi-Modal Convolutional Neural Network for Brain Tumor Segmentation
tags: deep-learning CNN segmentation medical
cite:
    authors: "Mehmet Aygün, Yusuf Hüseyin Şahin, Gözde Ünal"
    title:   "Multi-Modal Convolutional Neural Network for Brain Tumor Segmentation"
    venue:   "Arxiv 2018-09-17"
pdf: "https://arxiv.org/pdf/1809.06191.pdf"
---

### The idea

This approach claims that most CNN used for brain tumor segmentation only concatenate modalities (T1, T2, flair, etc.) and then try to learn a single representation for all of them. With their approach, they train on each modality separately and then fuse the different representations at different "fusion points" in their architecture and using different methods. They claim an increase in accuracy of 30% over previous methods and an increase of 5% accuracy over the baseline model.

### The implementation
![](/article/images/multi-modal-cnn-brain-tumors/baseline.jpg)

Their baseline model used 3D-convolutions of 4x25x25x25 (4 representations, patches of 25^3, no need for RGB since images are gray-scale) as input and output five 9x9x9 probability maps for each tumor class after eight convolution layers.

![](/article/images/multi-modal-cnn-brain-tumors/model.jpg)

Their idea is to consider all modalities as seperate inputs to different CNNs, and then combine them after diffrent fusion points (early, middle, late). The specific implementation of 'early', 'middle' and 'late' heavily depends on the architecture. Fusion is done either through a 'max' function, 'sum' or a convolution filter that concatenates the four modalities and applies a convolution to produce a single output. The parameters of the convolution are learned during training.

### The methodology

They used Tensorflow for their implementation, Adam optimizer, cross-entropy loss, L1 and L2 reg and dropout for FC and conv layers and trained 50 epochs on the BRATS 2015 dataset (50 patients used for test and 224 for training). No pre-processing was done except normalization.

### The results
The actual results are super sketchy. See notes below

![](/article/images/multi-modal-cnn-brain-tumors/results.jpg)
For the early, middle and late fusion points respectively. Dice score is calculated like this: ![](/article/images/multi-modal-cnn-brain-tumors/dice.jpg) where P is the set of voxels predicted to be a tumor and T is the ground truth.

According to them, they have an increase of 5% dice score over the baseline model<sup>1</sup> and 30% increase in dice score over the results of BRATS 2015<sup>2</sup>. Late fusion also requires much memory than early and late fusion, so they have compared the performance gains versus memory usage using accuracy/# of parameters

![](/article/images/multi-modal-cnn-brain-tumors/memory.jpg)

<sup>1</sup> Looking at the [baseline's paper](https://arxiv.org/pdf/1603.05959.pdf), I couldn't find what results they were comparing to. According the the results in this paper, Multi-Modal performed 5% *worse*

<sup>2</sup> 30% increase over the *mean* of the results in [BRATS 2015](https://ieeexplore.ieee.org/document/6975210/). Kinda sketchy.

