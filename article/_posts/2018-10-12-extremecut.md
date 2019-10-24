---
layout: review
title:  "Deep Extreme Cut: From Extreme Points to Object Segmentation"
tags:   deep-learning Segmentation CNN  
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1711.09081.pdf 
cite:
  authors: "K.-K. Maninis, S. Caelles, J. Pont-Tuset, L. Van Gool"
  title:   "Deep Extreme Cut: From Extreme Points to Object Segmentation"
  venue:   "CVPR 2018"
---

### Description



<center><img src="/article/images/extremecut/sc01.jpg" width="700"></center>

This paper presents a semi-automatic deep learning segmentation method.  The idea is quite simple but the results beat state-of-the-art solutions.  

To segment an object, the user is asked to select 4 keypoints : the topmost, the bottommost, the leftmost and the rightmost points.  Each point is then associated to a Gaussian kernel printed in a 2D image.  This 2D image is concatenated to the RBG input image thus leading to a 4-modality input image.  To improve results, the feed to the network a dilated cropped window around the 4 points.  

The proposed network is a modified ResNet101 without the last layers, without max poolings and with some dilated convolutions to make sure the output has the same size than the input.



### Results
They report a series of ablation results, but at the end of the day, they report state-of-the-art results.

<center><img src="/article/images/extremecut/sc02.jpg" width="400"></center>
<center><img src="/article/images/extremecut/sc03.jpg" width="800"></center>


