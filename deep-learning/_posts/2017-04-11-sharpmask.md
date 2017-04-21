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

SharpMask was designed as a successor to DeepMask. The main drawbacks from DeepMask were speed and performances.

SharpMask, using a double pyramid layout, is faster and more accurate than DeepMask. Indeed, SharpMask has an inference time of 0.8s where DeepMask needed more than 1.3 seconds to perform its task. The authors used DeepMask for the bottom-up pyramid, but they switched the finals layers, called "head" to be more efficient. They then add a top-down pyramid and laterals connections to make a prediction in the same way as DeepMask.

SharpMask is able to output more precise masks because of the fusion of low-level features and high-level features.
<div align="middle">
  <img src="/deep-learning/images/sharpmask/architecture.png" width="400">
</div>

## Changes between SharpMask and DeepMask
The major change between SharpMask and DeepMask is the refinement module. This enables more accurate boundaries. Also, DeepMask uses VGG to extract features where SharpMask uses ResNet-50.
### Heads
The authors modified the head of DeepMask to be faster. Instead of branching early, they branch just before prediction to have a smaller network. Head **C** is faster while keeping a good accuracy.
<div align="middle">
  <img src="/deep-learning/images/sharpmask/heads.png" width="500">
</div>
