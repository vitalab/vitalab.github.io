---
layout: review
title:  "Incremental Learning for Semantic Segmentation of Large-Scale Remote Sensing Data"
tags:   Incremental learning, catastrophic forgetting, deep-learning, segmentation, remote-sensing,
author: Charles Authier
pdf:  https://arxiv.org/abs/1810.12448
cite:
  authors: "Onur Tasar, Yuliya Tarabalka, Pierre Alliez"
  title:   "Incremental Learning for Semantic Segmentation of Large-Scale Remote Sensing Data"
  venue:   "Arxiv, 29 oct 2018"
---

Code: https://project.inria.fr/epitome/inc_learn/

## Method
One big probleme, catastrophic forgetting: a significant performance drop for the already learned classes when new classes are added on the data, having no annotations for the old classes.
They propose an incremental learning methodology, enabling to learn segmenting new classes without hindering dense labeling abilities for the previous classes, although the entire previous data are not accessible.

The key points of the proposed approach are adapting the network to learn new as well as old classes on the new training data, and allowing it to remember the previously learned information for the old classes.

For adaptation, they keep a frozen copy of the previously trained network, which is used as a memory for the updated network in absence of annotations for the former classes.
The updated network minimizes a loss function, which balances the discrepancy between outputs for the previous classes from the memory and updated networks, and the mis-classification rate between outputs for the new classes from the updated network and the new ground-truth.

![](/deep-learning/images/incrementallearning/intro.png)

## Loss

For a total of three losses:
- $$L_{class}$$ (sigmoid cross entropy loss)

![](/deep-learning/images/incrementallearning/loss1.png)

- $$L_{distill}$$, measures the disparity between $$y_{mem}$$ samples from the memory network, and $$y_{up_prev}$$ from the updated network.

![](/deep-learning/images/incrementallearning/loss2.png)

- $$L_{adapt}$$ is the Loss use during the adaptation

![](/deep-learning/images/incrementallearning/loss12.png)

- $$L_{rem}$$ is the costum loss for the Incremental learning

![](/deep-learning/images/incrementallearning/loss3.png)

## Network

This Network is a variant of U-net.

![](/deep-learning/images/incrementallearning/network.png)

- Static learning: This is the traditional learning approach, where they assume that all the training images and annotations for the same classes are available at the time of training.

- Multiple learning: In this learning strategy, they train an additional classifier whenever the new training data are obtained. The number of classifiers that needs to be stored increases linearly.

- Fixed representation: To learn new classes, they remove the classification layers, which were optimized for the previous classes and plug in new classification layers dedicated for the new classes. The newly added classification layers are initialized with Xavier method[^footnote]. When new training data arrive, thay optimize only the newly added classification layers and freeze the rest of the network.

- Fine-tuning: They use a similar strategy that fixed representation. The only difference is that while training the network, instead of only the classification layers, they optimize the whole network using only the new training data.

- Incremental learning: This strategy required for the memory network to generate probability maps from the training patches to optimize $$L_distil$$.

![](/deep-learning/images/incrementallearning/compare.png)

## Results

Not the new state-of-the-art, but show that it is not far and allow the network to learn new classes.

![](/deep-learning/images/incrementallearning/luxcarta.png)

![](/deep-learning/images/incrementallearning/image.png)

![](/deep-learning/images/incrementallearning/potsdam.png)


---

[^footnote]: X. Glorot and Y. Bengio, “Understanding the difficulty of training deep feedforward neural networks,” in Proceedings of the thirteenth international conference on artificial intelligence and statistics, 2010, pp. 249–256.
