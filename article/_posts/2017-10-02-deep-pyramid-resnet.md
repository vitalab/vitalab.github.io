---
layout: review
title:  "Deep Pyramidal Residual Networks"
tags:   deep-learning CNN classification
author: Clement Zotti
pdf:   "http://openaccess.thecvf.com/content_cvpr_2017/papers/Han_Deep_Pyramidal_Residual_CVPR_2017_paper.pdf"
cite:
  authors: "Han D., Kim J., Kim J."
  title:   "Deep Pyramidal Residual Networks"
  venue:   "Computer Vision and Pattern Recognition, 2017. CVPR 2017"
---

Paper:
- [code](https://github.com/jhkim89/PyramidNet)
    
This paper has two main contributions, a pyramidal architecture that concentrates the feature map dimension, they change slightly the usual resnet block by adding a zero-padded shortcut, and also try different layer combinations inside the block.

## Model

This model is a regular resnet but the number of feature maps in each layer are calculted by a formula.

![](/article/images/dpyres/eq2.jpg)
![](/article/images/dpyres/eq3.jpg)

With these equations, the number of feature maps in the network is really different from a regular resnet as shown in Figure 2.

![](/article/images/dpyres/fig2.jpg)

The new shortcut included in the residual block include a zero padding of the features and can be seen as a new residual path.

![](/article/images/dpyres/fig5.jpg)


Finally, they found empirically some impacts of the relu activation and batch normalization given their position in the network.

![](/article/images/dpyres/fig6.jpg)

## Results

They report results on three datasets namely, CIFAR-10, CIFAR-100, and ImageNet.

#### CIFAR-10 & CIFAR-100 
![](/article/images/dpyres/table4.jpg)

#### ImageNet
![](/article/images/dpyres/table5.jpg)
