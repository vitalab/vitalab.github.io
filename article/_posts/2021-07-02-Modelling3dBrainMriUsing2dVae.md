---
layout: review
title: "Modelling the Distribution of 3D Brain MRI using a 2D Slice VAE"
tags: deep-learning autoencoder medical brain MRI
author: "Nathan Painchaud"
cite:
    authors: "Anna Volokitin, Ertunc Erdil, Neerav Karani, Kerem Can Tezcan, Xiaoran Chen, Luc Van Gool, Ender Konukoglu"
    title:   "Modelling the Distribution of 3D Brain MRI using a 2D Slice VAE"
    venue:   "MICCAI 2020"
pdf: "https://arxiv.org/pdf/2007.04780.pdf"
---


# Highlights
- Method to model 3D MR brain volumes distribution by combining a 2D slice VAE with a Gaussian model that captures the
relationships between slices;
- Novel evaluation method for generated volumes that quantifies how well their segmentations match those of true brain
anatomy, called the *Realistic Atlas Score* (RAS).


# Introduction
Although Variatonal Autoencoder (VAE) models have become popular in the last few years to model the distribution of 2D
data, their application to 3D data remains very limited. This can be explained by limitations in available training data
and computational resources. Thus, volumetric VAEs mainly showed results on down-sampled coarse 3D data, for example
3x64x64x32 *space-time* cuboids, instead of the more usual 256x256x256 resolution.


# Methods

## Modeling distribution of 3D images with 2D VAE
The authors' proposed method is quite simple. They train a 2D VAE to generate MRI slices, and use Gaussian distributions
to model the prior's mean and covariance on each slice.

![](/article/images/Modelling3dBrainMriUsing2dVae/figure1.jpg)


## Evaluating quality of the generated samples with RAS
The authors also propose a new metric to evaluate how "real" a generated volume appears to both a segmentation network
and a registration algorithm. Their metric can be computed like follows:

1. Segment the generated samples using a segmentation network trained using real images;
2. Register the generated samples to real images and map the predicted segmentation with the same transformation.
3. Evaluate the Dice score on the generated samples' registered segmentations.


# Data
The authors apply their method to T1 weighted MRI volumes from the Human Connectome Project (HCP) dataset, with some
custom preprocessing. In the end, they use 960 volumes for training and 40 for validation, resampled to ensure a
consistent size of 256x256x256 at 0.7x0.7x.07 mm<sup>3</sup> resolution.


# Results

![](/article/images/Modelling3dBrainMriUsing2dVae/figure2.jpg)
![](/article/images/Modelling3dBrainMriUsing2dVae/table1.jpg)
![](/article/images/Modelling3dBrainMriUsing2dVae/figure4.jpg)


# Remarks
- The authors often mention the "slice dimension", but their VAE has not explicit notion of a "slice dimension". So I
consider this reliance on a there being a "slice dimension" to be optimist;
- The sampling procedure doesn't seem to generate slices for a given volume that are more correlated with one another
than with slices from a distinct volume. Each slice seems to be drawn from the prior distribution of latents for that
slice, and then slices sampled independently are stacked together to form a volume.


# References
- Code is available on GitHub: [https://github.com/voanna/slices-to-3d-brain-vae/](https://github.com/voanna/slices-to-3d-brain-vae/)
