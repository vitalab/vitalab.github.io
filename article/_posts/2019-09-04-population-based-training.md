---
layout: review
title: "A Generalized Framework for Population Based Training"
tags:
author: ""
cite:
    authors: "Ang Li et al."
    title:   "A Generalized Framework for Population Based Training"
    venue:   "KDD 2019 (and short paper at a NeurIPS 2019 workshop)"
pdf: "https://arxiv.org/abs/1902.01894"
---

The authors present a method for **optimizing hyperparameters while training the parameters** of the model. The method is based on evolution, and uses "trials". A trial is a small chunk of training that has a warm-start using parameters from a previous trial.

This is considered "**black box hyperparameter optimisation**", because the method does not need to know about the network architecture. The **only requirement is that the network can be warm-started by loading weights**, and that performance of the network can be measured.

# Overview of the components

![](/article/images/pbt/fig1.png)
![](/article/images/pbt/fig2.png)
![](/article/images/pbt/fig3.png)

# Evolution

The evolution process consists basically in selecting the best performing trials in the pool and mutating them to produce new trials, keeping the population size constant. There are multiple tricks used to make the process efficient and work in lower-resource situations; see sections 3.7 and 3.8 of the paper for details.

# Results

The authors claim to have trained a state-of-the-art WaveNet for voice synthesis using their proposed method (PBT). **They only optimize the learning rate!** This means that their method can be seen as optimising the learning rate schedule.

PBT can converge faster than others, if the number of workers and population size is well chosen. In addition, PBT has less variance than random search, as shown in Fig. 10.

In the figures below, PBT-5x5 means that there are 5 parallel workers and a population of 5; while PBT-5x20 means that the population is 20.

The following figure shows that PBT-5x5 is the most efficient in terms of compute. The next figure shows that PBT-5x20 produces better results at a given iteration.

![](/article/images/pbt/fig4.png)
![](/article/images/pbt/fig6.png)