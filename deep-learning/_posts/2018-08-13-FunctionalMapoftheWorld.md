---
layout: review
title:  "Functional Map of the World"
tags:   deep-learning, classification, bounding-boxes, CNN, LSTM, remote-sensing, dataset
author: Charles Authier
pdf:  https://arxiv.org/pdf/1711.07846
cite:
  authors: "Gordon Christie, Neil Fendley, James Wilson, Ryan Mukherjee"
  title:   "Functional Map of the World"
  venue:   "CVPR 2018"
---

## Dataset
Over 1 million images from over 200 countries. Each image, provide at least one bounding box annotation containing one of 63 categories.

the dataset includes:
- UTM Zone (zone of projection)
- Timestamp (year, month, day, hour, minute, second, and day of the week UTC)
- GSD (Ground sample distance)
- Angles (the sensor is imaging the ground, as well as the angular location)
- Image+box sizes

3 types of images: 8/4/3 bands, 4 and 8 are RGB with multispectral images (MSI).
All images are 256x256 with roughly 30cm resolution.

![](/deep-learning/images/FunctionalMapoftheWorld/class_world.png)

## Meaning of the paper
The paper presents an analysis of the dataset along with baseline approaches to show relation about metadata and temporal views.

Approaches:
- LSTM-M An LSTM architecture trained using temporal sequences of metadata features.
- CNN-I A standard CNN approach using only images, where DenseNet is fine-tuned after ImageNet. Softmax outputs are summed over each temporal view, after which an argmax is used to make the final prediction. The CNN is trained on all images across all temporal sequences of train + val.
- CNN-IM A similar approach to CNN-I, but with metadata features concatenated to the features of DenseNet before the fully connected layers.
- LSTM-I An LSTM architecture trained using features extracted from CNN-I.
- LSTM-IM An LSTM architecture trained using features extracted from CNN-IM.

![](/deep-learning/images/FunctionalMapoftheWorld/images_world.png)

## Results

![](/deep-learning/images/FunctionalMapoftheWorld/results_world.png)

In conclusion, the concatenation of the metadata and the features of DenseNet help the classification of world images.
