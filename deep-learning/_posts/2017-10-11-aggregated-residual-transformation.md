---
layout: review
title:  "Aggregated Residual Transformations for Deep Neural Networks"
tags:   deep-learning CNN classification
author: Clement Zotti
pdf:   "http://openaccess.thecvf.com/content_cvpr_2017/papers/Xie_Aggregated_Residual_Transformations_CVPR_2017_paper.pdf"
cite:
  authors: "S. Xie, R. Girshick, P. Dollár, Z. Tu, K. He"
  title:   "Aggregated Residual Transformations for Deep Neural Network"
  venue:   "Computer Vision and Pattern Recognition, 2017. CVPR 2017"
---

Paper:
- [code](https://github.com/facebookresearch/ResNeXt)
    
The main contribution of this paper is a new "cardinality" for the resnet block.

## Model

The difference between the resnet block and resnext block is really simple and well summarized in Figure 1.

![](/deep-learning/images/aggregrestrans/resnext_block.png)

They split the convolution in multiple parts (Figure 1 in 32 parts). They argue that the cardinality dimension controls the number of complex transformations and is more effective than width or depth dimension. Table 1 show side by side a resnet with a resnext with the same number of parameters and the same number of FLOPS.

![](/deep-learning/images/aggregrestrans/model_eq.png)

where $$C$$ is the cardinality discussed before and it produces groups of convolutions as in Figure 1.

## Results

They report results on three and a half dataset Imagenet 1k, Cifar10, MSCOCO, and Imagenet 1k trained on Imagenet 5k

#### Imagenet 1k

![](/deep-learning/images/aggregrestrans/imagenet_1k.png)
![](/deep-learning/images/aggregrestrans/imagenet_1k_res.png)

![](/deep-learning/images/aggregrestrans/imagenet_5k_1k.png)

#### Cifar10

![](/deep-learning/images/aggregrestrans/cifar10.png)

#### MSCOCO
![](/deep-learning/images/aggregrestrans/mscoco.png)

