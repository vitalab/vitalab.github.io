---
layout: review
title: "Efficient Interactive Annotation of Segmentation Datasets with Polygon-RNN++"
tags: deep-learning RNN CNN segmentation reinforcement
author: "Philippe Poulin"
cite:
    authors: "Acuna, D., Ling, H., Kar, A. and Fidler, S."
    title:   "Efficient Interactive Annotation of Segmentation Datasets with Polygon-RNN++"
    venue:   "CVPR2018"
pdf: "https://arxiv.org/abs/1803.09693"
---


## Summary

Everything is there : CNN, RNN, Reinforcement Learning, Gated Graph Neural Network!


**Automatic/interactive instance segmentation by building a polygon around the object from a provided bounding box**

![](/deep-learning/images/polygon-rnn-plusplus/figure2.png)

1) CNN predicts the first vertex, and provides features for the GGNN

2) RNN predicts multiple sequences of vertices (beam search) to build rough (28x28) candidate polygons

3) "Evaluator" network scores polygons to keep the best

4) GGNN upscales and readjusts polygons



**Semi-supervised: Annotator can correct vertices in sequential order, and the model then re-predicts the rest of the polygon**


### CNN

- Modified ResNet-50: dilations, reduced strides and skip connections

![](/deep-learning/images/polygon-rnn-plusplus/figure4.png)

### RNN

- 2-layer convolutional LSTM + attention
- Prediction: [(28 x 28) + 1] one-hot vector (last bit is used for end-of-sequence token)

### Reinforcement Learning

- Initialize with cross-entropy, then use RL
- Train using IoU instead of cross-entropy loss
- Reduce exposure bias problem (teacher forcing)
- REINFORCE, with 1 sample Monte Carlo + greedy baseline

### Evaluator Network

- Small ConvNet predicts IoU
- Input: CNN features + last ConvLSTM state + polygon
- Structure: 3x3 conv -> 3x3 conv -> FC
- Trained separately after RL fine-tuning
- L2 loss

![](/deep-learning/images/polygon-rnn-plusplus/figure3.png)

### Gated Graph Neural Network

- Extends RNN to graphs using message passing between nodes for a predefined number of steps (T=5)
- Input: polygon represented as a cyclic graph; for each node, a patch is extracted from the image
- Prediction : relative displacement in a D'xD' grid (treated as a classification task)
- Cross-entropy loss

![](/deep-learning/images/polygon-rnn-plusplus/figure5.png)


## Results

![](/deep-learning/images/polygon-rnn-plusplus/table1.png)

### Cityscapes automatic segmentation (GT vs Faster-RCNN boxes)
![](/deep-learning/images/polygon-rnn-plusplus/figure10.png)

### Cityscapes automatic segmentation vs human annotator
![](/deep-learning/images/polygon-rnn-plusplus/figure16.png)

### Faster-RCNN + Polygon-RNN++
![](/deep-learning/images/polygon-rnn-plusplus/figure18.png)



