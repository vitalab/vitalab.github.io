---
layout: review
title: "Synthesized b0 for diffusion distortion correction (Synb0-DisCo)"
tags: deep-learning synthesis GAN medical MRI brain
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Kurt G. Schilling et al."
    title:   "Synthesized b0 for diffusion distortion correction (Synb0-DisCo)"
    venue:   "Magnetic Resonance Imaging 2019"
pdf: "https://www.sciencedirect.com/science/article/pii/S0730725X18306179"
---


# Highlights

Authors propose to synthesize B0 images using a cycle Generative
Adversarial Network (cGAN) for magnetic susceptibility correction on diffusion
MRI data.


# Introduction

EPI acquisitions are affected by geometric and intensity distortions caused by
susceptibility induced field imperfections.

Distortions in EPI images typically manifest as stretching or compression of
geometry in the phase-encoding (PE) direction, accompanied by signal "pile-up"
resulting in low and high intensity regions.

A widely used distortion correction strategy is to acquire pairs of images with
reverse PE (i.e. Anterior-Posterior and Posterior-Anterior) gradients (often
referred to as a "blip-up blip-down" acquisition), yielding pairs of images with
the same contrast, but distortions reversed in directions. The undistorted image
can then be derived by warping the two images to the mid-way point between them.

However, not all imaging protocols include a blip-up blip-down acquisitions.

Authors propose to synthesize an undistorted EPI image from the structural image
(T1) and use the non-distorted synthetic image as an anatomical target.

They name their method "Synb0-DisCo".


# Methods

Authors propose to train three orthogonal 3-channel standard, 2D pix2pix cGANs
to synthesize three-slice stacks of diffusion imaging data in the axial,
coronal, and sagittal planes. The network takes as input a diffusion B0 scan
and conditions it to the structural T1 scan.

At inference time, a T1 image is fed into the network. The generative models for
each 3 orientations are applied to each orientation stack independently. The
resulting channels are then combined to obtain a synthesized, non-distorted B0
scan.

The non-distorted synthetic image is then used as an anatomical target for
susceptibility distortion correction. The correction is performed by feeding the
synthesized B0 and B0 volumes to the conventional FSL Eddy/TOPUP pipeline. Only
the real B0 is warped, forcing its geometry to match the undistorted synthesized
image.


## Data

586 subjects split into 80%/20% training/validation, each with:

 - 1 T1 MPRAGE
 - 1 multi-shot EPI (no diffusion weighting, ideally undistorted)
 - 33 single-shot EPI images (B0 + 32 DWI)

The multi-shot EPI is used to learn the T1 to B0 intensity mapping.


# Results

The method was tested against 2 datasets:

- 1 scan containing reverse PE (AP/PA) acquisitions
- 25 scans

The method's ability to correct distortions was assessed measuring the
differences in FA and Mutual Information (MI) metrics.

For the dataset containing reverse PE acquisitions, images corrected with
Synb0-DisCo result in a similar distortion correction when compared to the
common TOPUP pipeline using the AP/PA acquisitions. Computed MI and FA
differences show coherence across pairs.

Quantitatively, corrected scans show an increased MI, although smaller than
TOPUP corrections, and reduced variation in diffusion metrics.

For the second dataset, qualitatively, a better match to the T1 geometry is
observed after correction, as well as an increase in the MI metric between the
T1-weighted signal and the corrected B0 signal.


# Conclusions

Results show that the method is "practically equivalent" to having both blip-up
and blip-down non-diffusion weighted images for distortion correction.

However, authors acknowledge that using three separate networks and the using a
filtering process to generate the 3D volume results is undesired blurring.

Even if the training and prediction sequences were not acquired within the same
facilities, and the method still provides meaningful results, authors are
cautious about the possibility of using the method in more dissimilar datasets.

Similarly, the performance on non-healthy subjects was not assessed.

Authors note that the question of how real the synthesized images is still an
open question. Further benchmarking is needed, including the effects in
"downstream" processing pipelines (e.g., tractography).
