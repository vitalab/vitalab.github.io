---
layout: review
title: "Diminishing Uncertainty within the Training Pool: Active Learning for Medical Image Segmentation"
tags: brain deep-learning medical MRI tractography white-matter
author: "Thierry Judge"
cite:
    authors: "Vishwesh Nath, Dong Yang, Bennett A. Landman, Daguang Xu, Holger R. Roth"
    title: "Diminishing Uncertainty within the Training Pool: Active Learning for Medical Image Segmentation"
    venue: "IEEE transactions on medical imaging"
pdf: "https://arxiv.org/pdf/2101.02323.pdf"
---

# Introduction

Authors explore active learning for the task of segmentation of medical imaging data sets.

They propose the following 3 contributions:

1. A query by committee method based on an adaptation of Stein variational gradient descent (SVGD) for Dice log-likelihood loss.
2. Uncertainty estimation using mutual information between labeled set and unlabeled set to increase diversity in training set
3. Increasing frequency of uncertain samples in the training set by allowing model to sample image multiple times.

# Methods

![](/article/images/DiminishingUncertaintyAL/method.jpg)


## Querying 

Authors use a **query by committee** framework which uses multiple models to estimate uncertainty. 
This requires a committee of models which is implemented with a Stein variational gradient descent (SVGD). SVGD is a 
joint optimization technique for ensemble models. M copies of model parameters, $$Θ = \Theta = \{\theta^q\}^M_{q=1}$$, 
referred to as particles are jointly optimized. Each particle in trained to reach a unique local minima by repulsive 
forces between each particle. 

Each particle is updated by $$\theta_{k+1} \leftarrow \theta_k + \epsilon_k \phi(\theta_k)$$ where $$\phi(\theta_k)$$ is

![](/article/images/DiminishingUncertaintyAL/eq1.jpg)

$$r(\theta, \theta')$$ is a positive definite radial basis function (RBF).  

Authors adapt SVGD to Dice log-likelihood loss which is defined as $log(\mathcal{L}_{dice})$ (standard fomulation of 
SVGD uses entropy loss). 

## Uncertainty estimation 
Authors use an entropy based epistemic (model) uncertainty for every 3D voxel defined by 

![](/article/images/DiminishingUncertaintyAL/eq2.jpg)

this is computed for every particle $$q$$ and every sample in the unlabeled set. 

Authors also add a second term to the score of a sample based on mutual information with samples from the labeled set.

![](/article/images/DiminishingUncertaintyAL/eq3.jpg)

where $$P(x^{\mathcal{T}}_i, x^{\mathcal{U}}_j)$$ is the joint probability and $$P(x^{\mathcal{T}}_i)$$, 
$$P(x^{\mathcal{U}}_j)$$ are marginal probabilities with respect to the histograms of the two images. 




The epistemic uncertainty and mutual information are normalized and the final score is calculated according to: 

![](/article/images/DiminishingUncertaintyAL/eq4.jpg)

The mutual information term is subtracted because a lower score for mutual information indicates more diversity. 


## Deleting samples 
Contrary to other active learning methods, the authors propose leaving samples in the Unlabeled pool once they are 
labeled. Therefore, if the model is still uncertain about this sample in subsequent steps, it can be sampled once again 
but will not require more labeling. 

# Data

Authors test their method on 2 datasets:
* Pancreas and tumor segmentation based on 3D computed tomography (CT) volume
*  Hippocampus segmentation of two different regions of interest based on T1-weighted magnetic resonance imaging (MRI)


# Results

![](/article/images/DiminishingUncertaintyAL/tab1.jpg)
![](/article/images/DiminishingUncertaintyAL/tab2.jpg)

![](/article/images/DiminishingUncertaintyAL/fig3.jpg)
![](/article/images/DiminishingUncertaintyAL/fig8.jpg)



# Conclusions
 

# Comments

Authors mention that they used a lighter version of UNet for rapid experiment for faster testing and do not use any 
data augmentation to only evaluate the active learning methods. 

Training time was 160 and 60 GPU hours for pancreas and hippocampus datasets respectively.


