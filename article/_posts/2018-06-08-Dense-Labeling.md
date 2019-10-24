---
layout: review
title:  "Dense labeling of large remote sensing imagery with convolutional neural networks: a simple and faster alternative to stitching output label maps"
tags:   deep-learning deep-learnig, segmentation, CNN, classification, remote-sensing
author: Charles Authier
pdf:    https://arxiv.org/pdf/1805.12219
cite:
  authors: "Bohao Huang, Daniel Reichman, Leslie M. Collins, Kyle Bradbury, Jordan M. Malof"
  title:   "Dense labeling of large remote sensing imagery with convolutional neural networks: a simple and faster alternative to stitching output label maps"
  venue:   "Arxiv, Submitted on 30 May 2018 for 2018 IGARSS"
---

The *normal* way to cut the images is to cut it in *"tiles"*, but this approach suffers from computational inefficiency and can result in discontinuities at output boundaries to overcome this problem, and substantially reduce the negative impacts of label stitching, by **artificially increasing the input-patch size of CNNs only during label inferenc**.

![](/article/images/dense-labeling/other_paper.jpg)

They propose an approach in which the input size of the CNN is dramatically increased only during label inference. They evaluate the performance in comparaison of a conventional stitching approach using two segmentation models and two large-scale remote sensing imagery datasets.

The results suggest that the proposed approach substantially reduces label inference time, while also yielding modest overall label accuracy increases.

## Models

- U-Net
- Deeplab-CRF

## Datasets

- INRIA building labeling competition
- The solar array labeling dataset

## Experiments

Giving a 321x321 patches but resized the output of the networks to give 736x736.

![](/article/images/dense-labeling/Dense_labeling_graph.jpg)

![](/article/images/dense-labeling/Dense_labeling_img.jpg)

![](/article/images/dense-labeling/Dense_labeling_time.jpg)

![](/article/images/dense-labeling/Dense_labeling_iou.jpg)


### Acknoledgements

This approach contributed to winning entry (overall performance) in the INRIA building labeling competition.
