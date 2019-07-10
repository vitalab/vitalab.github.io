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

This paper presents a multi-task method in which the computation of a subnetwork (or _unit_) depends on the current task and current inference budget.

The assignment between a task and a unit, and whether a unit is assigned to a task for a particular budget, is determined by a simple algorithm based on the following assumption: tasks that are close-by in terms of task ID should be similar, and will share feature maps.

Below is an explorable explanation of the algorithm for task $$\in \{1,2,3,4\}$$ and budget $$\in \{1,2,3\}$$. The brightness of the unit's color corresponds to the affinity between the unit and the current task, and consequently the order of computation (brightest computed first).

<iframe width="100%" style="height: 5.5em" src="{{ site.baseurl }}/article/other/virtual_nets.html"></iframe>

If you think this does not make a lot of sense, you are not alone.