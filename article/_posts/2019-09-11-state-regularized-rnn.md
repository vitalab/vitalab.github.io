---
layout: review
title: "State-Regularized Recurrent Neural Networks"
tags: RNN layers 
author: "Philippe Poulin"
cite:
    authors: "Cheng Wang and Mathias Niepert"
    title:   "State-Regularized Recurrent Neural Networks"
    venue:   "ICML2019"
pdf: "https://arxiv.org/abs/1901.08817"
---


# Highlights

- Replace the RNN hidden state by a finite set of learnable states using a stochastic state transition mechanism
- "Stabilizes" the hidden state for long sequences
- "Better interpretability and explainability"

# Method

## Model figure

![](/article/images/state-regularized-rnn/figure2.jpg)


## Method summary

The hidden state of the RNN is replaced by $$S$$, a $$d \times k$$ matrix, where $$k$$ is the number of possible states (centroids) and $$d$$ is the dimension of the hidden states.

![](/article/images/state-regularized-rnn/equation3.jpg)

A probability distribution is computed using Eq.3, where $$ \mathbf u_t \, $$  is the "regular" output of an RNN timestep.
> Note: The computation is a softmax that uses a temperature parameter $$ \tau $$, that pushes the distribution towards a one-hot encoding as it decreases.

Then, _in theory_, a new state is sampled, but this would make the RNN un-differentiable _(see top of Fig.2)_; instead, the new state is a weighted sum of the centroids _(see bottom of Fig.2)_ :

![](/article/images/state-regularized-rnn/equation6.jpg)

- For _memory-less_ RNNs (such as GRU), it means that they can be represented by a Deterministic Finite Automata as $$ \tau \rightarrow 0 $$.
- For _memory_ RNNs (such as LSTM), it pushes the representational power to the cell state instead of the hidden state.
- In all cases, it limits _drifting_ (where the values of the hidden state increase in magnitude with the length of the sequence).

![](/article/images/state-regularized-rnn/figure3.jpg)


# Experiments

- IMDB (sentiment analysis)
- Sequential MNIST


## Results

![](/article/images/state-regularized-rnn/table5-7.jpg)


## Learned centroids

![](/article/images/state-regularized-rnn/figure7.jpg)

