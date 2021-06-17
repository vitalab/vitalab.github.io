---
layout: review
title: "Uncertainty Estimation Review"
tags: machine-learning essentials blog
author: Thierry Judge
---

# Introduction

This post with review uncertainty methods with an emphasis on segmentation, especially for medical imaging. 

# Evaluating Uncertainty

## Model calibration


## Uncertainty-error overlap
In the case of segmentation, uncertainty of a prediction can be predicted via an uncertainty map. An uncertainty map is 
uncertainty prediction for each pixel. Uncertainty map quality can be evaluated by computing the uncertainty-error 
overlap. Uncertainty-error overlap is computed by obtaining the dice score of the uncertainty map and a pixel-wise error
map between the prediction and the groundtruth segmentation map. 

# Uncertainty Estimation Methods 
   
## Softmax
The simplest way to estimate uncertainty for a classification task is to use the probabilities of the softmax output 
layer. Given a vector $$\vec{p}$$ of probabilities produced by a softmax operation with $$C$$ classes, one can evaluate the uncertainty by 
computing:
* The maximum class probability: $$max(\vec{p})$$. The value must be flipped to obtain uncertainty as most certain 
samples will have high confidence. 
* The margin between the top 2 classes: $$sort(\vec{p})_0 - sort(\vec{p})_1$$. The value must be flipped to obtain 
uncertainty because the smaller the difference between the two most probable classes, the higher the uncertainty.
* The entropy of the vector: $$\sum_{i=0}^C \vec{p}_i \log(\vec{p}_i)$$. The higher the entropy, the higher the 
uncertainty as the entropy will be at its highest if all classes are equally probable $$ \vec{p}_i = \frac{1}{C}$$.

In the case of a simple classification output, this results in one uncertainty value per classification. In the case of 
segmentation, the uncertainty evaluation is done for each pixel an results in an uncertainty map with one real value per
pixel.  

_Temperature Scaling_




## Ensembles

## Bayesian neural networks

#### Bayes by backprob

Blundell et al. introduce a way of training bayesian neural networks know as *Bayes by Backprop* in 
Weight Uncertainty in Neural Networks [^1]. Instead of having a point estimate for each weight, bayesian neural 
networks learn a distribution over each parameter.

![](/blog/images/uncertainty/bayesbybackprop.jpg)
[^1]

Given Baye's theorem 

$$
P(w|D) = \frac{P(D|W)P(W)}{P(D)}
$$



#### MC Dropout
Gal et al. 

#### What uncertainties are needed?
Kendall et al. 

![](/blog/images/uncertainty/whatuncertainties1.jpg)



Estimating heteroscedastic aleatoric uncertainty involved predicting the variance. Predicting variance is easier to 
understand in the case of regression. Given a gaussian assumption, the standard mean squared error loss function is the 
following: 

$$
L(\theta) = \frac{1}{N} \sum_{i=1}^N ||y_i - f(x_i)||^2
$$

This is equivalent to prediction the mean of the gaussian distribution. However, it is also possible to predict the 
variance:  

$$
L(\theta) = \frac{1}{N} \sum_{i=1}^N \frac{1}{2\sigma(x_i)^2} ||y_i - f(x_i)||^2 + \frac{1}{2}\sigma(x_i)^2
$$

In the case of classification. 

Given a model logits $$f(x_i)$$ and variance prediction $$\sigma(x_i)$$, the logits can be corrupted by Gaussian nose with 
variance $$\sigma(x_i)^2$$. 

$$
\hat{x}_i | W \sim \mathcal{N}(f^W(x_i), \sigma^W(x_i)^2)
$$

$$
\hat{p}_i = \text{Softmax}(x_i)
$$

The expected log likelihood is therefore:

$$
\log E_{\mathcal{N}(f^W(x_i), \sigma^W(x_i)^2)}[\hat{p}_{i,c}]
$$

where $$c$$ is the groundtruth class. 

In practice, it is not possible to integrate the Gaussian distribution analytically. A Monte Carlo approximation must 
be done to sample from the distribution.   


## Auxiliary networks 


# Review articles
The following articles offer reviews of many different methods. 


# References

[^1]: Weight Uncertainty in Neural Networks