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

The authors present a method for optimizing hyperparameters while training the parameters of the model. The method is based on evolution, and uses "trials". A trial is a small chunk of training that has a warm-start using parameters from a previous trial.

# Overview of the components

![](/article/images/pbt/fig1.png)
![](/article/images/pbt/fig2.png)
![](/article/images/pbt/fig3.png)

# Evolution

The evolution process consists basically in selecting the best performing trials in the pool and mutating them to produce new trials.

# Results

The proposed method (PBT) can converge faster than others, if the number of workers and population size is well chosen. In addition, PBT has less variance than random search, as shown in Fig. 10.

![](/article/images/pbt/fig4.png)
![](/article/images/pbt/fig5.png)
![](/article/images/pbt/fig10.png)