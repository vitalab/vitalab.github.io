---
layout: review
title: "Using convolution neural networks to learn enhanced fiber orientation
distribution models from commercially available diffusion magnetic resonance
imaging"
tags: brain deep-learning medical MRI tractography
author: "Jon Haitz Legarreta Gorroño"
cite:
    authors: "Oeslle Lucena and Sjoerd B. Vos et al."
    title: "Using convolution neural networks to learn enhanced fiber
    orientation distribution models from commercially available diffusion
    magnetic resonance imaging"
    venue:   "NeuroImage"
pdf: "https://arxiv.org/pdf/2008.05409v1.pdf"
---


# Highlights

- Authors present a method to regress multi-shell fiber orientation distribution
(FOD) values using single-shell data.
- The method is tested in two different generalization settings: a different
acquisition protocol; and a fewer gradient encoding direction protocol.


# Introduction

Local fiber orientation distributions (FODs) are computed from diffusion
Magnetic Resonance Imaging (dMRI) data to estimate the white matter (WM) fiber
organization. The dMRI acquisition protocol has a direct consequence on the
ability to accurately extract the WM anatomy: multi-shell acquisitions
allow for more accurate tissue and/or micro-structure models to be used, and
thus provide FODs that are able to resolve fiber configurations with increased
complexity. Given that multi-shell acquisitions are longer than single-shell
acquisitions, their use is limited in clinical practice. Hence, the interest
for trying to improve the accuracy of the FODs using fewer (single-shell) data.

Authors propose to use single-shell dMRI data to compute more accurate or
reliable FODs. They use two regular, 3D convolutional neural networks (CNNs),
namely a U-Net and a HighResNet, to regress on multi-shell SH coefficients.


# Methods

Authors used regular 3D U-Net and HighResNet architectures with minimal
adaptations.

The input to the network is the coefficients of the Constrained Spherical
Deconvolution (CSD) model applied to the diffusion data (thus, the spherical
harmonic -SH- coefficients). The input volumes are split into patches. The
networks output the fiber orientation distributions at each voxel

Each input shell data was used separately when training their network: i.e. they
computed the SH coefficients using a single-shell 2-tissue CSD (2TS-CSD) model,
and the network regressed on the multi-shell, multi-tissue (M-CSD) SH
coefficients.

Data are augmented applying random rotations to the FODs.

Authors used an $$l_{max} = 4$$ to compute the SH. Although the HCP dataset
allows for a larger value, this allows them to test their method when the test
data contains fewer gradient encoding directions.

The performance of the networks was evaluated using the mean absolute error
(MAE) and the angular correlation coefficient (ACC) between the predicted and
ground truth, M-CSD SH coefficient value for each voxel in the WM.

## Data

Two datasets were used:
- The HCP dataset ($$b = {1000, 2000, 3000 s/m^2}$$; $$90$$ gradient encoding
directions per shell). Data from $$45$$ subjects was used.
- An in-house dataset acquired at the National Hospital For Neurology and
Neurosurgery Queen Square (QS): $$b = {700, 2500 s/m^2}$$; $$32$$ and $$64$$
gradient encoding directions, respectively. Data from $$50$$ subjects was used.

# Results

The baseline method they use is a 2TS-CSD model.

Three experiments are presented:

- Performance on a subset of data corresponding to the same acquisition protocol
the training data was issued from:
![](/article/images/FODCNNLearning/Results_Experiment1_plot.jpg)
![](/article/images/FODCNNLearning/Results_Experiment1_table.jpg)

Comparatively, a larger improvement is observed on the QS dataset with respect
to the baseline method.

- Performance on a subset of data corresponding to a different acquisition
protocol the training data was issued from:
![](/article/images/FODCNNLearning/Results_Experiment2_plot.jpg)
![](/article/images/FODCNNLearning/Results_Experiment2_table.jpg)

- Performance on a subset of data computed using less gradient encoding
directions to a different acquisition (both using the same and different
acquisition protocols with respect to the training data):
![](/article/images/FODCNNLearning/Results_Experiment3_plot.jpg)
![](/article/images/FODCNNLearning/Results_Experiment3_table.jpg)


# Conclusions

The proposed method shows an improvement over MAE and ACC measures with respect
to the baseline under all tested conditions.

Authors conclude that these methods can be trained on high-quality data and be
used to improve FOD estimation in lower-quality dMRI data.


# Comments

- The deep neural networks improving the baseline's performance in terms of the
MAE and ACC is expected since they are trained to regress on the M-CSD data. The
reported baseline method's ACC is already relatively high.
- The extent at how well their method performs on data acquired with a different
acquisition protocol should be considered with care: if the input to the network
are SH coefficients, then the generalization ability should be assumed, so the
performance should be approximately the same as in a test dataset for the same
acquisition protocol.
- It is unclear the benefit of their approach when testing on data containing
fewer gradient encoding directions or shells: if fewer gradient data is
available, it can be expected that the FODs will not be as accurate as when more
data is available (i.e. the resolved crossing will not be demanding), and thus a
network that is trained on such a setting might do as a good job.
- Although authors claim that their method provides FODs closer to the ground
truth FODs compared to the baseline, it would have been clearer if the ability
to resolve fiber crossings had been evaluated. Also, a visual inspection of the
shown FODs does not seem to provide enough evidence to support the claim.
- Measuring the improvement of the proposed approach in terms of the provided
tractograms would have been an additional interesting result, since FODs are the
data source to build tractograms.
