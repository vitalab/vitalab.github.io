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

Instead of only doing salient object detection, the method proposed in this paper also segment different salient objects into different instances.

![](/article/images/salient-instance/idea.jpg)

# Contributions

1. A new dataset (1000 images of instance-level salient objects).
2. A multi-scale segmentation network. 

# Framework
![](/article/images/salient-instance/framework.jpg)

1. A multi-scale segmentation network is used to compute the saliency map and contour map.
2. The multiscale combinatorial grouping (MCG) algorithm [[1]](https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/mcg/resources/MCG_CVPR2014.pdf) was used to generate object proposals, and the subset optimization method [[2]](http://users.eecs.northwestern.edu/~xsh835/assets/cvpr2016_sod.pdf) selected the final salient proposals. 
3. A fully connected CRF step [[3]](https://arxiv.org/abs/1210.5644) was adopted to get the final instance segmentation. 

### 1. Multiscale segmentation network
- A U-Net like network architecture fusing segmentation result from multiple scales.

![](/article/images/salient-instance/msnet_1.jpg)

### 2. Proposal step

- 800 salient object proposals for any given image based on the contour map.
- Discard those proposals with fewer than 80% salient pixels
- The subset optimization is used produce a compact set of object proposals. (The final number of instances) 

### 3. CRF step
- Suppose the number of salient instances is K, and the background is treated as K+1 class.
- Define a probability map with K+1 channels
  - If a salient pixel is covered by a single detected salient instance, the probability of associated instance channel is 1. 
  - If a salient pixel is not covered by any detected salient instance, then set the probability of each instance channel to 1/K .
  - If a salient pixel is covered by m overlapping salient instances, the probability of associated m channels is 1/m.   
  - If a background pixel is covered by m overlapping salient instances, the probability of associated m channels is 1/(m+1), and the background channel is also 1/(m+1). 
  - If a background pixel is not cover by any instance, then the background channel is 1.
- A fully connected CRF is used for the final segmentation.

# Experiment Result

### The Multiscale segmentation network for saliency detection

![](/article/images/salient-instance/result_1.jpg)

### Instance-Level segmenation

![](/article/images/salient-instance/result_2.jpg)
