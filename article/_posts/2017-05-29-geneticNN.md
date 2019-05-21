---
layout: review
title:  "Evolving Neural Networks Through Augmenting Topologies"
tags:   machine-learning neural-network genetic-algorithm
author: Pierre-Marc Jodoin
pdf:    http://nn.cs.utexas.edu/downloads/papers/stanley.ec02.pdf
cite:
  authors: "K.O. Stanley and R. Miikkulainen"
  title:   "Evolving Neural Networks through Augmenting Topologies"
  venue:   "Journal Evolutionary Computation archive Volume 10 Issue 2, 2002 Pages 99-127 "
---

This paper presents a method called "NeuroEvolution of Augmenting Topologies (NEAT)" to learn the **weights AND topology** of a neural network through a *genetic algorithm* and without back propagation.  As they mention, their method:

> is based on applying three key techniques: tracking genes with history markers to allow crossover among topologies, applying speciation (the evolution of species) to preserve innovations, and developing topologies incrementally from simple initial structures

![](/article/images/geneticNN/sc01.jpg)

The main inconvenient of this approach is that it only applies to very small neural networks (with typically less than 10 neurons) as thousands of neural networks are being tested before convergence.

---

They even have a [wikipedia page](https://en.wikipedia.org/wiki/Neuroevolution_of_augmenting_topologies)!
