---
layout: review
title: "Unsupervised Detection of White Matter Fiber Bundles with Stochastic Neural Networks"
tags: brain deep-learning medical MRI segmentation tractography
author: "Daniel Jörgens"
cite:
    authors: "Dayan, M and Katsageorgiou, VM and Dodero, L and Murino, V and Sona, D"
    title:   "Unsupervised Detection of White Matter Fiber Bundles with Stochastic Neural Networks"
    venue:   "ICIP 2018"
pdf: "https://ieeexplore.ieee.org/document/8451498"
---


# Highlights

The authors propose an unsupervised approach based on restricted boltzmann machines (RBM)
for streamline clustering.

They compare the obtained clusters to those obtained from QuickBundles (QB)
in terms of streamline-based Dice coefficient.

# Introduction

Profiling of white matter bundles (i.e. analyzing metrics within individual bundle masks)
requires the delineation of particular masks. Two approaches exist for that:
 - supervised: classify '*streamlines according to predefined labels such as those extracted from an atlas*'.
   Useful in case of a-priori hypotheses.
 - unsupervised: not particularly aiming at '*tract groups*', but '*rather detect
   clusters of streamlines inherently akin to each other*'.
   Useful for '*whole-brain investigations without anatomical constraints*'.

Most unsupervised approaches require explicit choice of a distance metric.
 - Results might be sensitive to this choice.
 - '*Space complexity*': $$\mathcal{O}(n^2)$$.

# Methods

#### The model

The authors use a mean-covariance restricted boltzmann machine (mcRBM) to
learn '*a complex distribution*' '*where differerent bundles are represented
by different modes in the distribution*'. They claim mcRBMs are effective
'*in modeling real-valued Gaussian-like input data*'.

The model is depicted below. Terminology and chosen parameters are:
 - C hidden precision units (C=75)
 - D visible units $$v$$
 - F factors (F=75)
 - M hidden mean units (M=50).

Since it is a proof of concept they do not perform parameter optimization.

Input dimensions for K streamlines with N samples each: K x 3N.

**Figure**: *Check Fig. 1 in the paper. (Not included due to Copyright issues.)*

#### Ordering of sampling points

They propose a new way to define a unified ordering of the sampling points
of a streamline (needed, since there is no natural direction of a streamline).
In order to determine if a streamline should be flipped or not they compute
the minimal distance of each of the two options with each coordinate axis.
This results in an efficient implementation (see paper).

#### Clustering

Training is stopped once they obtain '$$100 +/- 10$$ *clusters having at least
100 streamlines each*'.

'*Once training is finished, bundles were created by grouping together all
fibers having the same latent representation.*' 

#### Data

'*Whole brain white matter bundles tend to be subject-specific so a single
(random) healthy subject was considered in this work.*'

They use HCP subject 100408:
 - FSL BEDPOSTX, ball and 3-stick model
 - deterministic tractography (camino) from WM interface
 - stopping criteria: FA \< 0.15 or curvature \> 70 degrees over 2mm
 - filter streamlines by length: keep \> 75mm

This results in 68K streamlines which are sampled at 50 points each.

### Reference method

They compare the obtained clusters with those obtained from QuickBundles:
 - default distance threshold: 20mm
 - keep only clusters with at least 100 streamlines.

They compare clusters by streamline-based dice coefficient (DC).

For each RBM cluster, the QB cluster with largest DC is reported as well
as the distribution of DCs for all other QB clusters.

# Results

Clusters 1-62 are associated with a unique QB cluster. Clusters 63-91
are associated to QB clusters that have more than one RBM match.

'Often' there was a large gap in DC between the best matching QB cluster (red marker)
and the rest (dashed blue line), '*suggesting a commonality between the
RBM and QB cluster sets.*'

'*The mean DC of 0.60 was found to be greater than the best mean DSC obtained
by*' Siless *et al.* (2016).

'*Lower values of DC were most often associated to RBM clusters with a
common QB match.*' The authors acknowledge that since there is no unique
way to define clusters the chosen way of assessing their algorithm
is limited in terms of performance evaluation.

**Figure**: Check Fig. 3 in the paper. (Not included due to Copyright issues.)*


# Conclusions

It seems that clustering with their approach is possible.
However, this is only a proof of concept with limitations:
 - one subject
 - low number of streamlines
 - deterministic tractography only
 - no hyperparameter optimisation
 - semi-automatic (number of clusters is explicitly chosen)
 - unclear performance measure (What would the optimal performance look like?
   What is the actual goal?) 


# References

 1. E. Garyfallidis, M. Brett, M. Correia, G. Williams, and I. Nimmo-Smith.
      Quickbundles, a method for tractography simplification,
      Frontiers in Neuroscience, vol. 6, pp. 175, 2012.
      
 2. V. Siless, K. Chang, B. Fischl, and A. Yendiki. Hierarchical Clustering
      of Tractography Streamlines Based on Anatomical Similarity, pp. 184–191,
      Springer International Publishing, Cham, 2016.
