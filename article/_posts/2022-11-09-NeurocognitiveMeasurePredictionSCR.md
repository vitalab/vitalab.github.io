---
layout: review
title: "A Novel Supervised Contrastive Regression Framework for Prediction of
Neurocognitive Measures Using Multi-Site Harmonized Diffusion MRI Tractography"
tags: brain contrastive-learning dMRI medical regression representation-learning tractography white-matter
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Tengfei Xue and Fan Zhang et al."
    title: "A Novel Supervised Contrastive Regression Framework for Prediction
    of Neurocognitive Measures Using Multi-Site Harmonized Diffusion MRI
    Tractography"
    venue: "arXiv"
pdf: "https://arxiv.org/pdf/2210.07411.pdf"
---


# Introduction

The accuracy of current models for predicting neurocognitive measures using
white matte (WM) measures extracted from diffusion MRI tractography (dMRI) is
low. Authors propose a Supervised Contrastive Regression (SCR) framework to
solve the task.


# Methods

SCR is a supervised contrastive learning method to perform regression on
continuous labels: authors
- Propose to use the absolute difference between labels to determine the
positive and negative sample pairs for contrastive learning.
- They extract 3 measures (fractional anisotropy (FA), mean diffusivity (MD),
and the number of streamlines (NoS)) from dMRI data and project them into the
identified tractography bundles.
- Use a permutation feature importance algorithm to identify the relevance of
the tractography clusters in the prediction.
- Use a different network for each dMRI feature and use ensemble learning.

Three neurocognitive scores are studied:
- General Ability
- Executive Function
- Learning/Memory

![](/article/images/NeurocognitiveMeasurePredictionSCR/Architecture.jpg)

The parcellation was conducted using an atlas (including both deep and
superficial WM bundles, DWM, SWM) developed at the same research group and the
White Matter Analysis (WMA) software.


Figure 2 shows the method steps:

![](/article/images/NeurocognitiveMeasurePredictionSCR/MethodDetail.jpg)

The projection network is an MLP or a single linear layer (FC).

The threshold value to determine whether two labels are considered as positive
or negative pairs is experimentally set.

Loss:

![](/article/images/NeurocognitiveMeasurePredictionSCR/Loss.jpg)

Once the supervised contrastive learning is finished, the encoder is frozen and
a regression head is added and trained on the mean squared loss (MSE) on the
scores to be prediced.

Authors use 10-fold cross validation.

For the bundle relevance identification, authors permute 10% of the features
randomly and measure the impact in performance to identify which features have
the largest impact.

## Data

8735 subjects from the Adolescent Brain Cognitive Development (ABCD) Study.

dMRI data was harmonized using a method[^1] from the same research group.


## Evaluation

The Pearson correlation coefficient is reported between the ground truth scores
and the predicted scores.


# Results

![](/article/images/NeurocognitiveMeasurePredictionSCR/Results-Table.jpg)


![](/article/images/NeurocognitiveMeasurePredictionSCR/Results-Bundles.jpg)


# Conclusions

Authors find that:
- SCR improves the accuracy for neurocognitive score prediction compared to
other state-of-the-art methods.
- The most predictive fiber clusters are predominantly in the SWM and projection
tracts.


# References

[^1]: S. Cetin Karayumak et al., "Retrospective harmonization of multi-site
      diffusion MRI data acquired with different acquisition parameters,"
      Neuroimage, vol. 184, pp. 180-200, 2019.


# Notes

Authors say that they use an MLP as their network model.

Slighlty related to https://vitalab.github.io/article/2022/09/30/WMTractsPointClouds.html
