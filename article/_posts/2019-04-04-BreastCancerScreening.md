---
layout: review
title:  "Deep Neural Networks Improve Radiologists' Performance in Breast Cancer Screening"
tags:   deep-learning medical-imaging
author: Antoine Théberge
pdf:    "https://arxiv.org/abs/1903.08297"
cite:
    authors: "Nan Wu, Jason Phang, Jungkyu Park, Yiqiu Shen, Zhe Huang et al."
    title:   "Deep Neural Networks Improve Radiologists' Performance in Breast Cancer Screening"
    venue:   "CVPR 2019"
---

[Blog post](https://medium.com/@jasonphang/deep-neural-networks-improve-radiologists-performance-in-breast-cancer-screening-565eb2bd3c9f)

[Code and trained model](https://github.com/nyukat/breast_cancer_classifier)

[Technical report](https://cs.nyu.edu/~kgeras/reports/datav1.0.pdf)

## Introduction

_"Breast cancer is the second leading cancer-related cause of death among women in the US. Early detection, through routine annual screening mammography, is the best first line of defense against breast cancer. [...] A radiologist can spend up to 10 hours a day working through these mammograms, in the process experiencing both eye-strain and mental fatigue."_

The authors propose a deep-learning method leveraging both pixel-level and patch-level precision that is as accurate as ensembles of radiologists. They also provide a new dataset that was used to train the proposed model.

## Dataset

Two challenges arise in breast cancer detection. One, the most commonly used mammography dataset contains only about 10 000 images. Second, mammography images are very high resolution (around 2000x2000). [Prior work](https://arxiv.org/abs/1703.07047) shows that downsampling these images can significantly hurt performance of computer vision models, so it is not a viable option.

The authors introduce the NYU Breast Cancer Screening Dataset (BCSD), consisting of ~230 000 screening mammography exams from ~150 patients, each exams consisting of four images (CC and MLO views of left and right breasts). 

From these 230 000 exams, 7000 biopsies were performed and the results were annotated by radiologists.

![](/article/images/BreastCancerScreening/data.jpg)

From this dataset, around 8% had malignant findings and 46% benign findings.

## Model

![](/article/images/BreastCancerScreening/model.jpg)

The authors used (_only_) ResNet-22 because of the size of the images and their available power (four Nvidia V100). To alleviate the size problem, the authors generated _heatmaps_ of benign and malign findings by applying a patch classifier in a sliding window classifier across the entire mammogram.

![](/article/images/BreastCancerScreening/heatmaps.jpg)

The patch classifier is a DenseNet-121 trained on 256x-256-sized patches and supposedly works "exceedingly well" with no actual results presented.

## Results

![](/article/images/BreastCancerScreening/results_tmi.jpg)

Since the above diagrams are way too cluttered, here is some clearer results from the blog post:

![](/article/images/BreastCancerScreening/results_blog.jpg)
