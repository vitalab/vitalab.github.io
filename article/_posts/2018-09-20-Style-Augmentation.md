---
layout: review
title:  "Style Augmentation: Data Augmentation via Style Randomization"
tags:   deep-learning deep-learning, classification, CNN
author: Charles Authier
pdf:  https://arxiv.org/abs/1809.05375
cite:
  authors: "Philip T. Jackson, Amir Atapour-Abarghouei, Stephen Bonner, Toby Breckon, Boguslaw Obara"
  title:   "Style Augmentation: Data Augmentation via Style Randomization"
  venue:   "arxiv 14 Sep 2018"
---

## Summary
This is a new form of data augmentation based on random style transfer, for improving the robustness of convolutional neural networks(CNN) over both classification and regression-based tasks.
During training, the style augmentation randomizes texture, contrast, and color, while preserving shape and semantic content.
This is accomplished by adopting an arbitrary style transfer network to perform style randomization, by sampling input style embeddings from a multivariate normal distribution.

They validate the efficacy of this technique with classification and monocular depth estimation, illustrating consistent improvements in generalization.

![](/article/images/StyleAug/styles.jpg)

#### Some definitions

* Style randomization: a simple and effective method for randomizing the action of a style transfer network to transform any given image to contain semantically valid but random styles.

* Style augmentation: the randomized action of the style transfer pipeline to augment image datasets to greatly improve downstream model performance.

* Omni-directional domain transfer: evaluation of the effectiveness of using style augmentation to implicitly improve performance on domain transfer tasks, which ordinarily require adapting a model to a specific target domain post-training.

## Style transfer

They chose the approach of Ghiasi et al. [^footnote], for its speed, flexibility, and visually compelling results.

![](/article/images/StyleAug/style-aug.jpg)

These style images are sampled from the Painter By Numbers (PBN) dataset.

![](/article/images/StyleAug/style-interpolation.jpg)

They perform a hyperparameter search to determine the best ratio of unaugmented to augmented training images and the best augmentation strength $$\alpha$$.

## Results

![](/article/images/StyleAug/style-results.jpg)

![](/article/images/StyleAug/style-table.jpg)

![](/article/images/StyleAug/style-mono.jpg)

![](/article/images/StyleAug/style-mono-table.jpg)

---

[^footnote]: Golnaz Ghiasi, Honglak Lee, Manjunath Kudlur, Vincent Dumoulin, and Jonathon Shlens. Exploring the structure of a real-time, arbitrary neural artistic stylization network. In British Machine Vision Conference, 2017.
