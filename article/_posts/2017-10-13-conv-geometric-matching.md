---
layout: review
title: "Convolutional neural network architecture for geometric matching"
tags: deep-learning siamese
author: "Philippe Poulin"
cite:
    authors: "I. Rocco, R. Arandjelovic, J. Sivic"
    title:   "Convolutional neural network architecture for geometric matching"
    venue:   "CVPR 2017"
pdf: "https://arxiv.org/pdf/1703.05593.pdf"
---

## Summary

The authors propose a convolutional neural network architecture for geometric matching, trainable end-to-end. They also show that the model is trainable using synthetically warped images without needing any manual annotation.

![](/article/images/conv-geometric-matching/figure1.jpg)


### Model

![](/article/images/conv-geometric-matching/figure2.jpg)

The proposed model is divided into three steps:
1. Extracting features from the two input images using siamese networks (CNN)
2. Matching features by computing all pairwise similarities
3. Predicting the geometric transformation parameters using a regression network (CNN)

![](/article/images/conv-geometric-matching/figure3.jpg)

![](/article/images/conv-geometric-matching/equation1.jpg)


### Model stacking

Instead of trying to directly predict a complex transformation, the authors propose to apply their model twice, starting with a simple linear transformation, then a more complex transformation:

1. Affine transformation (6 dof linear transformation = translation/rotation/non-isotropic scaling and shear)
2. Thin-plate spline transformation with 18 parameters

![](/article/images/conv-geometric-matching/figure5.jpg)


### Training

The model is trained by measuring the loss on an "imaginary" grid of points which is deformed by the transformation. The loss is then the summed squared distances between the points deformed by the ground truth transformation and the predicted transformation.

Note that the affine transformation network and the TPS transformation network are trained independently.


### Synthetic image generation

The training dataset is automatically created from a public image dataset, by performing random transformations.

![](/article/images/conv-geometric-matching/figure6.jpg)


## Experiments and Results

**Training dataset:** 
- Tokyo Time Machine (40k Google Street View images of Tokyo)

**Evaluation dataset:** 
- Proposal Flow (900 image pairs with large intra-class variations, e.g. ducks of different species, cars of different make, etc.)

![](/article/images/conv-geometric-matching/figure9.jpg)

The Proposal Flow task is to predict matching keypoint locations from an input image to a target image. The predictions are evaluated using average probability of correct keypoint (PCK). PCK is the proportion of keypoints that are correctly matched (i.e. within a certain distance of the target location).

![](/article/images/conv-geometric-matching/table1.jpg)

![](/article/images/conv-geometric-matching/figure8.jpg)
