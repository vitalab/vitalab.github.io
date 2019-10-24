---
layout: review
title:  "SharpMask : Learning to Refine Object Segments"
tags:   deep-learning CNN localization segmentation
author: Frédéric Branchaud-Charron
pdf:   "https://arxiv.org/pdf/1603.08695.pdf"
cite:
  authors: "Pinheiro, P. O., Lin, T. Y., Collobert, R., & Dollár, P."
  title:   "SharpMask : Learning to refine object segments"
  venue:   "European Conference on Computer Vision (pp. 75-91). Springer International Publishing."
---

SharpMask was designed as a successor to [DeepMask]({{ site.baseurl }}{% link article/_posts/2017-04-10-deepmask.md %}). The main drawbacks from DeepMask are speed and performances. Both can be used as an object detection method when combined with [R-CNN]({{ site.baseurl }}{% link article/_posts/2017-04-18-rcnn.md %}). This approach is using the popular [U-Net]({{ site.baseurl }}{% link article/_posts/2017-02-27-unet.md %}) architecture to combine low and high-level features.

SharpMask, using a double pyramid layout, is faster and more accurate than DeepMask. Indeed, SharpMask has an inference time of 0.8s where DeepMask needs more than 1.3 seconds to perform the same task. The authors used DeepMask for the bottom-up pyramid, but they switched the final layers, called "head" to be more efficient. They then add a top-down pyramid and lateral connections to make a prediction in the same way as DeepMask.

SharpMask is able to output more precise masks because of the fusion of low-level features and high-level features.
<div align="middle">
  <img src="/article/images/sharpmask/architecture.jpg" width="400">
</div>

## Changes between SharpMask and DeepMask
The major change between SharpMask and DeepMask is the refinement module. This enables more accurate boundaries. Also, DeepMask uses VGG to extract features where SharpMask uses ResNet-50.
### Heads
The authors modified the head of DeepMask to be faster. Instead of branching early, they branch just before prediction to have a smaller network. Head **C** is faster while keeping a good accuracy.
<div align="middle">
  <img src="/article/images/sharpmask/heads.jpg" width="500">
</div>
