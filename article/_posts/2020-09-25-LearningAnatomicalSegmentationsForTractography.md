---
layout: review
title: "Learning Anatomical Segmentations for Tractography from Diffusion MRI"
tags: brain deep-learning medical MRI segmentation tractography
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Christian Ewert and David Kügler and Anastasia Yendiki and Martin
    Reuter"
    title: "Learning Anatomical Segmentations for Tractography from Diffusion
    MRI"
    venue:   "arXiv"
pdf: "https://arxiv.org/pdf/2009.04392.pdf"
---


# Highlights

- Authors present a method to perform segmentation of brain regions directly on
diffusion MRI data (instead of conventional T1-weighted data).
- Their work includes generalization experiments.


# Introduction

Current practice for diffusion MRI (dMRI) analysis, including tractography,
relies on T1-weighted MRI data for tissue segmentation. Authors argue, however,
that it is desirable to rely directly on dMRI data to obtain those features.
According to the authors, using data from diffusion MRI would, in theory, avoid
registration inaccuracies and interpolation artifacts when registering the
T1-weighted images to the dMRI data.

They propose a deep learning framework based on a previous pipeline called
FastSurfer[^1] to segment 170 brain regions (cortical, subcortical and white
matter) from dMRI data.

![](/article/images/LearningAnatomicalSegmentationsForTractography/Whole-brain_segmentation.jpg)


# Methods

Their model is the FastSurferCNN[^1] model, which is a U-Net that uses three
separate convolutional neural networks trained independently on axial, coronal,
and sagittal slices. Predictions from each orientation are combined using a
weighted average. The skip connectiones are substituted by dense blocks to
reduce the number of parameters.

The loss includes a weighted logistic loss term and the Dice similarity term:

![](/article/images/LearningAnatomicalSegmentationsForTractography/Loss.jpg)

The optimal input to the network used was studied and chosen among
- A sequence of stacked DTI tensor components from the slice at issue and the
neighboring slices. Since the number of dMRI encoding gradients available is
larger than the 6 required for a DTI tensor, authors used different combinations
of the diffusion data to feed the network.
- FA maps.
- dMRI data.

The ground truth labels were obtained from FreeSufer.

The segmentation quality is measured in terms of the Dice score and the
Hausdorff distance. The tractoraphy enabled by the segmentations is assessed
using the Hausdorff distance.

## Data

Human Connectome Project (HCP) data was used: train: 250 subjects; validation:
50 subjects; test: 100 subjects.


# Results

- Using more dMRI gradient encoding data to fit the DTI tensor provides better
results across all segmented tissues and measures.
- Using directly the dMRI data provides results comparable to using a large
number of gradient encoding directions to fit the DTI tensor.
- Larger target areas also show better scores.

![](/article/images/LearningAnatomicalSegmentationsForTractography/Results-Different_input_data.jpg)

- Results of a network trained on tensors using $$n$$ dMRI gradient encoding
data *vs.* testing on tensors using $$m$$ ($$n \neq m$$) dMRI gradient encoding
data:

![](/article/images/LearningAnatomicalSegmentationsForTractography/Results-Generalization.jpg)

- The white matter tractography based on their method is within the variability
of TRACULA compared to the T1-weighted-based segmentations:

![](/article/images/LearningAnatomicalSegmentationsForTractography/Results-Tractography_Hausdorff.jpg)


# Conclusions

Their work demonstrates that white matter tractography is feasible using tissue
segmentation directly on dMRI data.


# Comments

- It is unclear why the Hausdorff distance scores for the *other regions* is
worse compared to the cortex and white matter areas.

# References

[^1]: Leonie Henschel, Sailesh Conjeti, Santiago Estrada, Kersten Diers, Bruce
      Fischl, and Martin Reuter. FastSurfer - A fast and accurate deep learning
      based neuroimaging pipeline. NeuroImage 219, 117012 (2020), http://www.sciencedirect.com/science/article/pii/S1053811920304985
