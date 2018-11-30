---
layout: review
title: "Neural Ordinary Differential Equations"
tags: deep-learning RNN layers optimization
author: "Philippe Poulin"
cite:
    authors: "Chen, T.Q., Rubanova, Y., Bettencourt, J. and Duvenaud, D."
    title:   "Neural Ordinary Differential Equations"
    venue:   "NIPS2018"
pdf: "https://papers.nips.cc/paper/7892-neural-ordinary-differential-equations"
---

## Summary

From Wikipedia:
> In mathematics, an ordinary differential equation (ODE) is a differential equation containing one or more functions of one independent variable and its derivatives. The term ordinary is used in contrast with the term partial differential equation which may be with respect to more than one independent variable.

Main idea:

A deep neural network contains a discrete sequence of layers. 
Instead, we can represent it as a continuous-depth model.

Discrete hidden state equation:
![](/deep-learning/images/neural-ode/equation1.png)

> In the limit when we add more layers and take smaller steps, we parametrize the derivative of the hidden state using a neural network, and the output is computed using a black box differential equation solver:

> ![](/deep-learning/images/neural-ode/equation2.png)

Advantages:
- constant memory cost
- adapt the evaluation strategy to each input
- can explicitly trade numerical precision for speed

Applications:
- continuous normalizing flows
- continuous time-series models


### Backpropagation through ODE solver operations

The ODE solver is treated as a black box, and gradients are computed using the _adjoint_ method (Pontryagin et al., 1692).

This approach computes gradients by solving a second, augmented ODE backwards in time.

> ![](/deep-learning/images/neural-ode/equation3.png)

> ![](/deep-learning/images/neural-ode/equation3_5.png)

> ![](/deep-learning/images/neural-ode/equation4.png)

> ![](/deep-learning/images/neural-ode/equation5.png)

> ![](/deep-learning/images/neural-ode/figure2.png)

>All three of these integrals can be computed in a single call to an ODE solver, which concatenates the original state, the adjoint, and the other partial derivatives into a single vector.


### Experiment 1: MNIST

> ![](/deep-learning/images/neural-ode/table1.png)


### Error control

> ODE solvers can approximately ensure that the output is within a
given tolerance of the true solution.

> ![](/deep-learning/images/neural-ode/figure3.png)

### Normalizing flows

> ![](/deep-learning/images/neural-ode/figure4.png)

> ![](/deep-learning/images/neural-ode/figure5.png)


### Generative latent function time-series model

> ![](/deep-learning/images/neural-ode/equation11-13.png)

The model is trained as a Variational Auto-Encoder, with sequence-valued observations.

> ![](/deep-learning/images/neural-ode/figure6.png)

### Time-series Latent ODE Experiments

> ![](/deep-learning/images/neural-ode/table2.png)

> ![](/deep-learning/images/neural-ode/figure9.png)

> ![](/deep-learning/images/neural-ode/figure8.png)
