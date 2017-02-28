

```
---
layout: review
title:  SSD: Single Shot MultiBox Detector (2016)
author: Frédéric Branchaud-Charron
link:   https://arxiv.org/pdf/1512.02325.pdf
tags:   convolutional-networks deep-learning object-detection bounding-boxes
---
```

Single shot MultiBox Detector

## Summary

**SSD** is an adaptation of **YOLO** to support prior shapes. Using prior shapes, **SSD** doesn't need to learn the aspect ratio, it predicts the correct prior box and the class. Also, SSD is using multiples features map to achieve a better performance.

## Model

The model is using the **VGG-16** model for its base. It then uses severals features maps to produce its output.

It's a more complex model than **YOLO** but it's faster because the input size is smaller.

![ssd_model][/deep-learning/images/ssd_model.png]



Using Atrous Convolution speed up the model by 20%

### Default boxes

Default boxes are computed from the training sets, they are similar to the anchor boxes from R-CNN. They help the network getting the right aspect-ratio.



## Loss

The loss function is similar to **YOLO**'s loss function. Instead of multiples detection per cell, it predicts a box per prior box. The loss is computed on the prior boxes with a Jaccard overlap bigger than 0.5. This allows multiples prediction per cell.



## Implementations

[SSD_Tensorflow](https://github.com/seann999/ssd_tensorflow)

[SSD Keras](https://github.com/rykov8/ssd_keras)
