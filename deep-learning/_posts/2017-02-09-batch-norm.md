---
layout: review
title: Batch Normalization
author: Carl Lemaire
link: /papers/batch-norm.pdf
tags: deep-learning essentials regularization
---

Batch Normalization (_Batch Norm_, BN) is a layer to be inserted in a deep neural network, to accelerate training.

# Why use it

We want to reduce _**Internal Covariate Shift**_ : the change in the distributions of internal nodes of a deep network during training. It is advantageous for the distribution of a layer input $$ x $$ to remain fixed over time. To do so, we will **fix the means and variances of layer inputs**.

Consider a layer with sigmoid activation $$ z = g(Wu + b) $$. For all dimensions of $$ x = Wu + b $$ except those with small absolute values, the gradient flowing down to $$ u $$ will vanish and the model will train slowly. Since $$ x $$ is affected by $$ W, b $$ and the parameters of the layers below, changes to those parameters during training will likely move many dimensions of $$ x $$ into the saturated regime of the sigmoid and **slow down training**.

Training converges faster when the inputs of the network are whitened (linearly transformed to have $$ \mu = 0, \sigma^2 = 1 $$, and decorrelated). Thus, **we'd like to apply whitening to the input of each layer**.

# How it works

**Normalize each feature independently.**{: .phead} Consider a layer with $$ d $$-dimensional input $$ \bold{x} = (x^{(1)} \ldots x^{(d)}) $$. We normalize each dimension $$ k $$ like so :

$$ \hat{x}^{(k)} = \frac{x^{(k)} - \mathrm{E}[x^{(k)}]}{\sqrt{\mathrm{Var}[x^{(k)}]}} $$

where the mean and variance are computed on the **mini-batch**.

**Add an affine transform just after.**{: .phead} Only applying a normalization can reduce the representational power of the network. For example, a sigmoid would be constrained to its linear regime. Following the normalization by a learnable affine transform addresses this issue. The BN operation becomes :

$$ y^{(k)} = \gamma^{(k)}\hat{x}^{(k)} + \beta^{(k)} $$

Notice that if the parameters would learn the values $$ \gamma^{(k)} = \sqrt{\mathrm{Var}[x^{(k)}]} $$ and $$ \beta^{(k)} = \mathrm{E}[x^{(k)}] $$, we would recover the original activations, if that were the optimal thing to do.

**Why do we need to backprop through it ?**{: .phead} Consider a layer $$ x = u + b $$, where $$ b $$ is a learned bias. We normalize the result using the mean of the activation computed over the whole training data : $$ \hat{x} = x - \mathrm{E}[x] $$. If a gradient descent step ignores the dependence of $$ \mathrm{E}[x] $$ on $$ b $$, then it will update $$ b \leftarrow b + \Delta b $$, where $$ \Delta b \propto \partial \text{loss} / \partial \hat{x} $$. Then,
  
$$ u + (b + \Delta b) - \mathrm{E}[u + (b + \Delta b)] = u + b - \mathrm{E}[u + b] $$

thus the normalization cancelled the effect of the update of $$ b $$. As training continues, $$ b $$ **will grow indefinitely while the loss remains constant**. To address this, we must view the normalization as a transformation taking both the sample $$ \bold{x} $$ and the whole mini-batch $$ \mathcal{X} $$ :

$$ \hat{x} = \mathrm{Norm}(\bold{x}, \mathcal{X}) $$

This means that we need to compute two Jacobians :

$$ \frac{\partial \mathrm{Norm}(\bold{x}, \mathcal{X})}{\partial \bold{x}} \qquad \frac{\partial \mathrm{Norm}(\bold{x}, \mathcal{X})}{\partial \mathcal{X}} $$

The latter term allows us to consider the mini-batch statistics in the process of gradient descent, which in turn avoids the parameter explosion described above.

# How to use it

Test