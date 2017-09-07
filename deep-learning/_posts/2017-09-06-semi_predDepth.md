---
layout: review
title: "Semi_Supervised Deep Learning for Monocular Depth Map Prediction"
tags: semi_supervise for predict depth
author: Faezeh Amjadi
cite:
    authors: "Yevhen Kuznietsov, jorg stuckler, Bastin Leibe"
    title:   "Semi_Supervised Deep Learning for Monocular Depth Map Prediction"
    venue:   "CVPR 2017"
pdf:   "https://arxiv.org/pdf/1702.02706.pdf"
---

The author proposes a depth map prediction in a
semi-supervised way for a monocular image. The network is a CNN (a deep residual network architecture in an encoder-decoder scheme) and output of the network is a disparity prediction (or inverse of depth).

The network is trained by unsupervised and supervised depth cues. The supervised part compares the output of network with the ground truth.

The unsupervised part learns depth prediction, directly from the stereo images that the left image was feed to the network, so with the left image and disparity (output of the network), each pixel from the left image can be mapped to the right image and inverse. Thus, the author defines loss by direct image alignment error in both directions in this part. [ unsupervised because the network doesnt use ground truth to calculate the loss].


An **important** note is that the author use BerHu_norm indsead of L2_norm in supervised loss that performs better on test set and reduce the noise. 

<div align="middle">
  <img src="/deep-learning/images/pred_depth/1.png" width="400">
</div>


## Experiments and results


<div align="middle">
  <img src="/deep-learning/images/pred_depth/2.png" width="600">
</div>


<div align="middle">
  <img src="/deep-learning/images/pred_depth/3.png" width="600">
</div>


