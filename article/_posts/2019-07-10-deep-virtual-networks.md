---
layout: review
title: "Deep Virtual Networks for Memory Efficient Inference of Multiple Tasks"
tags: CNN multi-task multi-task-learning pruning-acceleration
author: "Carl Lemaire"
cite:
    authors: "Eunwoo Kim, Chanho Ahn, Philip H.S. Torr, Songhwai Oh"
    title:   "Deep Virtual Networks for Memory Efficient Inference of Multiple Tasks"
    venue:   "CVPR 2019"
pdf: "https://arxiv.org/abs/1904.04562"
---

This paper presents a **multi-task** method in which the computation of a subnetwork (or _unit_) depends on the current task and current **inference budget**. Units are groups of feature maps; there are $$k$$ units in each convolutional layer.

# Conditional computation of units

The assignment between a task and a unit, and whether a unit is assigned to a task for a particular budget, is fixed before training using a simple algorithm based on the following assumption: tasks that are close-by in terms of task ID should be similar, and will share feature maps.

Below is an explorable explanation of the algorithm for task $$\in \{1,2,3,4\}$$ and budget $$\in \{1,2,3\}$$. The brightness of the unit's color corresponds to the affinity between the unit and the current task. Black units are not computed.

<iframe style="width: 100%; height: 5.5em" src="{{ site.baseurl }}/assets/virtual_nets.html"></iframe>

# Results and discussion

The authors claim to outperform other methods, but this claim does not seem to be statistically significant. The highest performance improvement mentioned in the paper is 0.75%, most are around 0.5%, and the lowest is 0.05% (for CIFAR-10/100). It seems that all results have been produced with $$N=1$$, a choice that ignores the stochasticity of weight initialization. Also, the authors exclude certain weights when computing the number of weights used, but they do not discuss about the fairness of their comparisons.

About the very limited improvement brought by the method, one could argue that it is not surprising considering the questionable choice of approach for assigning units. It seems that the idea of Virtual Networks would be much better implemented by learning the assignments, instead of fixing them in advance.