---
layout: review
title: "Universal adversarial perturbations"
tags: deep-learning classification
author: "Philippe Poulin"
cite:
    authors: "S-M. Moosavi-Dezfooli, A. Fawzi, O. Fawzi, P. Frossard"
    title:   "Universal adversarial perturbations"
    venue:   "CVPR 2017"
pdf: "https://arxiv.org/pdf/1610.08401.pdf"
---

## Summary
The authors propose a systematic algorithm for computing universal perturbations to fool image classification networks. The perturbations are shown to work very well across neural networks.

![](/article/images/univ-adv-perturbations/figure1.jpg)

The proposed algorithm has two parameters:
1. The norm of the perturbation to be added to images
2. The desired fooling rate

The idea is to iteratively go over images and build the "universal perturbation" $$v$$ by computing the minimal modification to $$v$$ that causes each image to be misclassified.

![](/article/images/univ-adv-perturbations/figure2.jpg)

![](/article/images/univ-adv-perturbations/algorithm1.jpg)


## Experiments and Results

**Dataset:** ILSVRC 2012 validation set (50,000 images)

Note that in Table 1, "X" is the training set on which the universal perturbation is computed.

![](/article/images/univ-adv-perturbations/table1.jpg)

![](/article/images/univ-adv-perturbations/table2.jpg)

![](/article/images/univ-adv-perturbations/figure6.jpg)

![](/article/images/univ-adv-perturbations/figure4.jpg)
