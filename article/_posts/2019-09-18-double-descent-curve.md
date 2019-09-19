---
layout: review
title: "Reconciling modern machine learning practice and the bias-variance trade-off"
tags: deep-learning optimization
author: "Carl Lemaire"
cite:
    authors: "Mikhail Belkina, Daniel Hsub, Siyuan Maa, and Soumik Mandal"
    title:   "Reconciling modern machine learning practice and the bias-variance trade-off"
    venue:   "PNAS, 2019, 116 (32)"
pdf: "https://arxiv.org/pdf/1812.11118.pdf"
---

Common machine learning wisdom informs that the curve of the test risk (think "test loss at convergence") as a function of the capacity of a model should follow a U-shape (going from underfitting to overfitting). However, in modern practice, adding capacity seems to always yield lower test risk. The authors propose an explanation for this observation.

In summary, **test risk does follow a U-shaped curve before the capacity hits the _interpolation threshold_; however, after this threshold, risk decreases, eventually lower than before. At this point, a capacity increase, combined with a weight norm regularizer such as L2, makes the model smoother, while it still perfectly interpolates training data.**

![](/article/images/double-descent-curve/fig1.png)

To support these claims, the authors train to convergence different types of models:

* Neural networks with random Fourier features (1 learnable layer)
* Neural networks with random ReLU features (1 learnable layer)
* Decision trees
* Ensemble methods
* Fully connected neural network with a single hidden layer (2 learnable layers)

The last one, for which results are in the appendix, is the closest to typical models used in deep-learning. For each model, they recreate the _double descent curve_ with a plot of the test loss as a function of model capacity.

Here are the curves for the random Fourier features model and the fully connected network:

![](/article/images/double-descent-curve/fig2.png)
![](/article/images/double-descent-curve/fig9.png)

In those curves, the peak corresponds to the _interpolation threshold_. For a regression task, this threshold is where the number of parameters $$ N $$ equals the number of data points $$ n $$, where $$ n $$ is the number of examples multiplied by their dimensionality. For a classfication task with $$ C $$ classes, the threshold is expected at $$ N = C \cdot n $$. 

Below is an illustration of an univariate regression task. While the 40-feature model in blue interpolates the data perfectly, the 4000-feature model also does it, but with a smoother model (and lower norm).

![](/article/images/double-descent-curve/fig3.png)

