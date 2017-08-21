---
layout: review
title:  "Instance-Level Salient Object Segmentation"
tags:   deep-learning segmentation CNN
author: Zhiming Luo
pdf:    http://hcp.sysu.edu.cn/wp-content/uploads/2017/07/1704.03604.pdf
cite:
  authors: "G. Li, Y. Xie, L. Lin and Y. Yu"
  title:   "Instance-Level Salient Object Segmentation"
  venue:   "CVPR 2017"
---

Instead of only doing salient object detection, this paper also segment different salient objects into different instances.

![](/deep-learning/images/salient-instance/idea.jpg)

# Contributions

1. A new dataset (1000 images of instance-level salient objects).
2. A multi-scale segmenation networks. 
3. CRF optimization.

# Framework
![](/deep-learning/images/salient-instance/framework.jpg)

1. A multi-scale segmentation network is used to compute the saliency map and contours.
2. The multiscale combinatorial grouping (MCG) algorithm [[1]](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/mcg/resources/MCG_CVPR2014.pdf) was used to generate object proposals, and the proposal subset optimization method [[2]](http://users.eecs.northwestern.edu/~xsh835/assets/cvpr2016_sod.pdf) selects the final salient proposals. 
3. A fully connected CRF step was adopted to get the final instance segmenation. 

### 1. Multiscale segmentation network
![](/deep-learning/images/salient-instance/msnet_1.jpg)

### 2. Proposal step

>- 800 salient object proposals for any given image based on the contour map.
>- Discard those proposals with fewer than 80% salient pixels
>- The subset optimization is used produce a compact set of object proposals. (The final number of instances) 

### 3. CRF step
>- Suppose the number of salient instances is K, and the background is treated as K+1 class.
>- Define a probability map with K+1 channels
>>- If a salient pixel is covered by a single detected salient instance, the probability of correposed channel is 1. 
>>- If a salient pixel is not covered by any detected salient instance, the probability of the pixel having any label is 1/K .
>>- If a salient pixel is covered by m overlapping salient instances, the probability of the pixel having a label associated with one of the m salient instances is 1/m .   
>>- If a background pixel is covered by m overlapping salient instances, the probability of the pixel having a label associated with one of the m salient instances is 1/(m+1) , and the probability of the pixel having the background label is also 1/(m+1). 

>- A fully connected CRF[[3]](https://arxiv.org/abs/1210.5644) is used for the final segmentation.

# Experiment Result

### The Multiscale segmentation network for saliency detection

![](/deep-learning/images/salient-instance/result_1.jpg)

### Instance-Level segmenation

![](/deep-learning/images/salient-instance/result_2.jpg)
