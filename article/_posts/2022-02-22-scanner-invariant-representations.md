---
layout: review
title: "Scanner invariant representations for diffusion MRI harmonization"
tags: dMRI domain-adaptation
author: "Carl Lemaire"
cite:
    authors: "Daniel Moyer, Greg Ver Steeg, Chantal M. W. Tax, Paul M. Thompson"
    title:   "Scanner invariant representations for diffusion MRI harmonization"
    venue:   "Magn Reson Med. 2020; 84: 2174–2189"
pdf: "https://onlinelibrary.wiley.com/doi/epdf/10.1002/mrm.28243"
---

# Introduction

dMRI acquisitions from different hospitals can be different for a same patient, because of e.g. the brand of the scanner and the scanning protocol. We would like to harmonize acquisitions from different sites. In this approach, a VAE is trained, such that the decoding is conditionned on a site; this allows to convert images from one site to another. This method allows to harmonize data by choosing a reference site and converting all images to it.

The authors claim that their method enable working with an unpaired dataset, while LinearRISH (Mirazaalian) is not appropriate for this. However, it has been shown that LinearRISH can be used with unpaired data[^1]. The advantage of this new method seems to lie in its lower error metrics.

# Method

![Figure 1](/article/images/scanner-invariant-representations/fig1.jpg)

## Trainable modules

- Encoder that maps x to z
    + x is a patch of SH (center voxel + 6 neighbors)
    + z has minimal site (s) information
- Decoder that maps (z, s) to x_hat
    + x_hat is constructed such as it seems to come from site s.
- Adversarial predictor to predict true/fake **from x_hat**
- Dense layer (transformation matrix) to project SH back to DWI

## Losses

- Reconstruction loss (MSE) on x_hat
- Gaussian prior loss on z
- Marginal prior loss on z (minimizes the mutual information of z and s)
- Adversarial loss (the typical approach from GAN training)
- Loss for the SH-to-DWI projection (no mention of which kind in the paper!)

# Data

* CDMRI Challenge Harmonization dataset
* 15 subjects (10 for training-validation, 5 for testing)
* 2 scanners (Prisma, Connectom)
* 2 protocols (One with resolution of 30, other with 60; there are other differences)
* 2 x 2 = 4 sites (Prisma 30, Prisma 60, Connectom 30, Connectom 60)
* 10 x 4 = 40 acquisitions in the training set

## Preprocessing

(Copy-pasted from the paper)

- These volumes were then corrected for 
	- EPI distortions, 
	- subject motion, and
	- eddy current distortions using FSL’s TOPUP/eddy.37, 38
- Subjects from the “Connectom” scanner were then registered to the “Prisma” scanner using a affine transformation, 
- fit to a co-temporally acquired T1-weighted image volume (previously registered to each corresponding FA volume).
- The b-vectors were then appropriately rotated.
- In the case of the “Connectom” scanner, geometric distortions due to gradient non-linearities were corrected for using in-house software
- (For multi-task method) We downsample the spatial resolution of the high resolution scans to 2.4 mm isotropic to test the multi-task method, but keep the angular resolution differences.
- Mask for white matter tissue
- 8th order SH (L2 weighted solution instead of SVD solution for under-determined projections)

# Tasks

- Map Prisma 30 to Connectom 30 and back
- Map Prisma 30 to Prisma 60 and back
- Map Prisma 30 to Connectom 60 and back

![](/article/images/scanner-invariant-representations/schema.jpg)

# Evaluation

They perform extensive evaluation:

- Metrics: computed on FA, MD (mean diffusivity), MK (mean kurtosis) and RTOP (return to origin probability): APE (absolute percent error) and CV (coefficient of variation)
- Ablation tests
- Post-hoc adversary: train a site predictor on the latent vector z; and make sure we can't predict the site from it
- Baselines:
    + LinearRISH (Mirzaalian)
    + Single-site variant of their own method, where one VAE is trained for each site transition (??? confirm this)

## Reconstruction results

The following plot shows the error between the reconstructed signal and the true signal:

![](/article/images/scanner-invariant-representations/fig2.jpg)

## Site prediction from z

The post-hoc adversary is able to tell the correct site using the latent vector z **41%** of the time (random chance is 25%). It's hard to tell how good this value is. It's clear that z does contain some site information. Still, the reconstruction results suggest that the method is better at harmonizing than the baseline.

# Notes

[^1]: Even in the LinearRISH paper, the data is not paired. They create paired groups of subjects, on which they apply a mean. There is also a challenge paper where LinearRISH is used with even less constraints: Ning et al. 2020.