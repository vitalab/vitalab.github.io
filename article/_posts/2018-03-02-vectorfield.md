---
layout: review
title:  "Vector Field Based Neural Networks"
tags:   deep-learning deep-learning
author: Frédéric Branchaud-Charron
pdf:   https://arxiv.org/pdf/1802.08235v1.pdf
cite:
  authors: "Daniel Vieira, Fabio Rangel, Fabricio Firmino, Joao Paixao"
  title:   "Vector Field Based Neural Networks"
  venue:   "arXiv:1802.08235"
---

The authors propose a novel layer to perform non-linear transformations inside a neural network. They design a **Vector Field Layer** which learns a vector field to be applied to the input.

![](/article/images/vectorfield/fig1.jpg)

Let $$X$$ be the input, $$\mu_{i}$$ the means of the $$S$$ gaussians and $$V_{i}$$ the $$S$$ learned vectors.

We can compute $$X_{i+1} = X_{i} + h(K(X_{i}, \theta))$$, the transformed input.

$$h$$ is the step-size, $$\theta$$ are the parameters $$(\mu_{i}, V_{i})$$

$$K(X_{i}, \theta)$$ is a weighted sum of vectors, the weights are a result of a kernel function. (see eq. 2-3).

![](/article/images/vectorfield/eq23.jpg)

While this is early work, it's a really interesting method.
