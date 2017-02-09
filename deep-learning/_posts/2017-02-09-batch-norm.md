---
layout: review
title: Batch Normalization
author: Carl Lemaire
link: /papers/batch-norm.pdf
tags: deep-learning essentials regularization
---

# What it is

Batch Normalization (_Batch Norm_, BN) is a layer to be inserted in a deep neural network, to accelerate training.

# Why use it

We want to reduce _**Internal Covariate Shift**_ : the change in the distributions of internal nodes of a deep network during training. It is advantageous for the distribution of a layer input $$ x $$ to remain fixed over time. To do so, we will **fix the means and variances of layer inputs**.

Consider a layer with sigmoid activation $$ z = g(Wu + b) $$. For all dimensions of $$ x = Wu + b $$ except those with small absolute values, the gradient flowing down to $$ u $$ will vanish and the model will train slowly. Since $$ x $$ is affected by $$ W, b $$ and the parameters of the layers below, changes to those parameters during training will likely move many dimensions of $$ x $$ into the saturated regime of the sigmoid and **slow down training**.

Training converges faster when the inputs of the network are whitened (linearly transformed to have $$ \mu = 0, \sigma^2 = 1 $$, and decorrelated). Thus, **we'd like to apply whitening to the input of each layer**.

# How it works

**Why do we need to backprop through it ?**{: .phead} Consider a layer $$ x = u + b $$, where $$ b $$ is a learned bias. We normalize the result using the mean of the activation computed over the whole training data : $$ \hat{x} = x - E[x] $$. If a gradient descent step ignores the dependence of $$ E[x] $$ on $$ b $$, then it will update $$ b \leftarrow b + \Delta b $$, where $$ \Delta b \propto \partial \text{loss} / \partial \hat{x} $$. Then,
  
$$ u + (b + \Delta b) - E[u + (b + \Delta b)] = u + b - E[u + b] $$

thus the normalization cancelled the effect of the update of $$ b $$. As training continues, $$ b $$ **will grow indefinitely while the loss remains constant**.

# How to use it

Test