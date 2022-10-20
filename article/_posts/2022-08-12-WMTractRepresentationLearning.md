---
layout: review
title: "Learning Optimal White Matter Tract Representations from Tractography
using a Deep Generative Model for Population Analyses"
tags: autoencoder dimensionality-reduction dMRI medical representation-learning tractography VAE
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Yixue Feng and Bramsh Q. Chandio et al."
    title: "Learning Optimal White Matter Tract Representations from Tractography
    using a Deep Generative Model for Population Analyses"
    venue: "arXiv"
pdf: "https://www.biorxiv.org/content/10.1101/2022.07.31.502227v1.full.pdf"
---


# Highlights

- Propose a VAE for to predict WM structural anomalies in tractography.


# Introduction

Authors propose to use a convolutional VAE for anomaly detection between normal
control and cognitively impaired subjects using tractography data.


# Methods

They use a convolutional VAE as their DL model:
- Their streamlines are resampled to 256.
- They use batch normalization and average pooling layers.
- Gradient clipping is used to prevent exploding gradients.

Architecture

![](/article/images/WMTractRepresentationLearning/Architecture.jpg)

They investigate the effect of the latent space dimensionality in preserving
the streamline space distance:
- Streamline-wise distance: Minimum Direct Flip (MDF) distance in streamline
space vs. Euclidean distance in latent space.
- Centroid-wise distance: same as streamline-wise distance.
- Bundle-wise distance: bundle-based Minimum Distance (BMD) distance in
bundle-space vs. Wasserstein distance in latent space.

The Spearman and Pearson correlation, and the coefficient of determination
values are computed to determine the optimal dimension.

![](/article/images/WMTractRepresentationLearning/Distance_preservation_analysis.jpg)

## Data

- ADNI dataset: 141 participants: 10 with Alzheimer's Disease (AD), 22 mild
cognitive impairment (MCI); 87 cognitively normal controls (CN).
- Used multi-shell data.
- Registered all subjects to MNI space.
- 30 bundles were studied.
- 10 CN subjects are used for training.

## Evaluation

Mean absolute error (MAE) between the input and the reconstructed features.


# Results

Anomaly detection across bundles

![](/article/images/WMTractRepresentationLearning/Results-Anomaly_detection_bundle_scores.jpg)

Anomaly detection along bundles (tractometry)

![](/article/images/WMTractRepresentationLearning/Results-Anomaly_detection_tractometry.jpg)


# Conclusions

Authors identified 6 bundles with statistically significant group differences
and specific locations along the length of the tracts with anomalies after
controlling for age and sex effect.

