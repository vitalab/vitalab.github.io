---
layout: review
title: "State-Reification Networks: Improving Generalization by Modeling the Distribution of Hidden Representations"
tags: deep-learning denoising autoencoder adversarial sequence layers classification 
author: "Philippe Poulin"
cite:
    authors: "Lamb, Alex, Jonathan Binas, Anirudh Goyal, Sandeep Subramanian, Ioannis Mitliagkas, Denis Kazakov, Yoshua Bengio, and Michael C. Mozer"
    title:   "State-Reification Networks: Improving Generalization by Modeling the Distribution of Hidden Representations"
    venue:   "ICML2019"
pdf: "https://arxiv.org/abs/1905.11382"
---


# Highlights

- Help RNNs "stay on track" without teacher forcing (make them more robust to their own generated sequences that may differ from the training sequences)
- Make classification networks more robust to adversarial data
- Achieved by adding a Denoising Autoencoder (DAE) / Attractor Network inside a hidden layer


# Introduction

- The general idea is to find a way to map hidden states that may differ from the training examples towards the distribution seen during training.

![](/article/images/state-reification/figure1.jpg)



# Methods

- **Feed-forward Network:** Add a DAE inside a hidden layer; see *Figure 2 (c)*

- **RNN:** Add an Attractor Network inside a hidden layer of the RNN; see *Figure 2 (d)*
  - An Attractor network is a DAE with recurrent steps

![](/article/images/state-reification/figure2.jpg)


- Rolled-up graph:

![](/article/images/state-reification/rnn-sr.jpg)


- Complete figure (taken from the presentation slides):

![](/article/images/state-reification/rnn-sr-unrolled.jpg)



## Data

- Random binary sequences for *Parity* and *Majority* classification
- MNIST for adversarial classification
- Text8 (Wikipedia) for text generation


# Results

- Bit sequence classification for parity tests

![](/article/images/state-reification/figure3.jpg)


- MNIST classification to test whether reification is more useful in input space or hidden space

![](/article/images/state-reification/figure6.jpg)


- CNN adversarial experiments

![](/article/images/state-reification/table1.jpg)


# Conclusions

- No clear experiments for RNN generation, but overall looks easy to implement
- Seems to improve generalisation to new or noisy sequences, but needs more pratical experiments


# References

[Useful slides](https://icml.cc/media/Slides/icml/2019/halla(13-09-00)-13-09-00-4796-state-reificati.pdf)