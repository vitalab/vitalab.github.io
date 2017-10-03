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
    
This paper has two main contributions, a pyramidal architecture that concentrate the feature map dimension, they change slightly the usual resnet block by adding a zero-padded shortcut, and also try differents layers combinasion inside the block.

## Model

This model is a regular resnet but the numbers of feature maps in each layers are calculted by a formula.

![](/deep-learning/images/dpyres/eq2.png)
![](/deep-learning/images/dpyres/eq3.png)

With these equations, the number of feature maps in the network is really different from a regular resnet as shown in Figure 2.

![](/deep-learning/images/dpyres/fig2.png)

The new shortcut included in the residual block include a zero padding of the features and can be seen as a new residual path.

![](/deep-learning/images/dpyres/fig5.png)


Finally, they found empiricaly some impacts of the relu activation and batch normalization given their positions in the network.

![](/deep-learning/images/dpyres/fig6.png)

## Results

They report results on three dataset namely, CIFAR-10, CIFAR-100, and ImageNet.

#### CIFAR-10 & CIFAR-100 
![](/deep-learning/images/dpyres/table4.png)

#### ImageNet
![](/deep-learning/images/dpyres/table5.png)
