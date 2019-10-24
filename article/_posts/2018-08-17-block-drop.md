---
layout: review
title:  "BlockDrop: Dynamic Inference Paths in Residual Networks"
tags:   pruning-acceleration deep-learning network-pruning reinforcement
author: Carl Lemaire
pdf:    https://arxiv.org/pdf/1711.08393.pdf
cite:
  authors: "Zuxuan Wu et al."
  title:   "BlockDrop: Dynamic Inference Paths in Residual Networks"
  venue:   "CVPR 2018"
---

The authors propose a method that can predict, by looking at an image with a small CNN, which residual blocks to keep in a large Resnet at inference. According to the hypothesis that ResNets are ensembles of independent paths, blocks can be dropped while keeping useful signal going up to the classification head. The method is trained using RL; more specifically Policy Gradient.

![](/article/images/blockdrop/fig1.jpg)
![](/article/images/blockdrop/fig2.jpg)

# Reward Function

![](/article/images/blockdrop/eq3.jpg)

$$ \mathbf{u} $$ is the _policy vector_ describing which blocks to keep; $$ K $$ is the total number of blocks; and $$ \gamma $$ is the accuracy/speed trade-off parameter.

# Curriculum Learning

Since there is no ground truth for the _policy vectors_, it is very hard to learn a policy for the whole ResNet from scratch. Curriculum Learning helps: they keep the first $$ N $$ residual blocks and predict a _policy vector_ only for the remaining blocks, decreasing $$ N $$ as the policy network gets better. Eventually, $$ N = 0 $$ and the policy predicts the structure of the whole ResNet.

# Quantitative Results

![](/article/images/blockdrop/tab1.jpg)

With ResNet-101, an average speedup of 20% is obtained, which is an order of magnitude less than the $$ 2 \times $$ speedup typically yielded by pruning methods. However, BlockDrop is orthogonal to pruning; both approaches could be implemented at once.

# Qualitative Results

In a class-wise manner, the authors have selected 3 frequently occuring _policy vectors_, and show some of the corresponding instances:

![](/article/images/blockdrop/fig4.jpg)

The authors also discuss the link between image difficulty and the number of blocks used:

![](/article/images/blockdrop/fig5.jpg)