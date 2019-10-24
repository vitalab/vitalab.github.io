---
layout: review
title:  "The Lottery Ticket Hypothesis: Training Pruned Neural Network Architectures"
tags:   pruning-acceleration deep-learning network-pruning
author: Carl Lemaire
pdf:    https://arxiv.org/abs/1803.03635
cite:
  authors: "Jonathan Frankle, Michael Carbin"
  title:   "The Lottery Ticket Hypothesis: Training Pruned Neural Network Architectures"
  venue:   "arXiv:1803.03635"
---

# Context

>"Recent work on neural network pruning indicates that, at training time, neural networks need to be significantly larger in size than is necessary to represent the eventual functions that they learn."

# The hypothesis

>"[...] successful  training  depends  on  lucky  random  initialization  of  a smaller subcomponent of the network. Larger networks have more of these “lottery tickets,” meaning they are more likely to luck out with a subcomponent initialized in a configuration amenable to successful optimization."

The hypothesis is empirically supported as follows:

1. **Train neural net; save intial state of weights**
2. **Prune weights** as much as possible without significantly reducing the accuracy (pruning criterion: prune low-magnitude weights); small network is obtained (around 90% reduction in size)
3. **Reinitialize the pruned network and train it** to convergence; note the accuracy and convergence time
4. **Reinitialize the pruned network using the initial weights from step 1, and train it** to convergence; note the accuracy and convergence time
5. **Compare aggregated results of step 4 and 5**; the higher accuracy and/or convergence time of step 4 compared to step 3 supports the hypothesis.

# Pics or it didn't happen

![](/article/images/lottery/fig11.jpg)
![](/article/images/lottery/fig14.jpg)

# Caveats

* No experiments on large networks (the kind of network that needs to be pruned); although [the author says on reddit](https://www.reddit.com/r/MachineLearning/comments/85eo8v/r_the_lottery_ticket_hypothesis_training_pruned/dw3jci5) that he's hard at work producing those results
* No practical takeaway (authors _suggest_ that better initialization schemes could be discovered)