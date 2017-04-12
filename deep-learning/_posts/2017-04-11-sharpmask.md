---
layout: review
title:  "Feature Pyramid Networks for Object Detection"
tags:   deep-learning CNN localization bounding-boxes
author: Frédéric Branchaud-Charron
pdf:   "https://arxiv.org/pdf/1612.03144.pdf"
cite:
  authors: "T. Lin, P. Dollár, R. Girshick, K. He, B. Hariharan, S. Belongie"
  title:   "Feature Pyramid Networks for Object Detection"
  venue:   "Computer Vision and Pattern Recognition, 2017. CVPR 2017"
---

SharpMask was designed as a successor to DeepMask. The main drawbacks from DeepMask were speed and performances. SharpMask, using a double pyramid layout, is faster and more accurate than DeepMask. Indeed, SharpMask has an inference time of 0.8s where DeepMask needed more than 1.3 second to perform its task. The authors used DeepMask for the bottom-op pyramid, but they switched the finals layers, called "head" to be more efficient. They then add a top-down pyramid and laterals connections to make prediction in the same way as DeepMask.

SharpMask is able to output more precise masks because of the fusion of low-level features and high-level features.

## Change between SharpMask and DeepMask

# Heads
# result.
