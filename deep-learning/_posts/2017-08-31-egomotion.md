---
layout: review
title: "Inverse Compositional Spatial Transformer Networks"
tags: deep-learning CNN RNN
author: "Faezeh Amjadi"
cite:
    authors: "Chen-Hsuan Lin and Simon Lucey"
    title:  "Inverse Compositional Spatial Transformer Networks" 
    venue:   "CVPR 2017"
pdf: "https://arxiv.org/pdf/1612.03897.pdf"
---
   



## Prerequest


***novel view synthesis image***: given one input view of a scene, synthesize a new image of the scen seen from a different camera pose.
If we have rotation, translation Matrix and Intern camera parameters (R,T,K) **or** depth and translation Matrix (D,T), it is enough to generate new view image.

$$ x_{s} = K_{1} R_{1} T_{2} P_{w}$$

$$ x_{t} = K_{1} R_{2} T_{2} P_{w}$$

$$ p_{w} = T_{2} R_{2} K_{1} x_{t} $$

$$ p_{w} = K_{1} T_{2} T_{2} K_{1} x_{t} $$

 fig:

***Forward/Backward Warping*** : There are two ways to get from a pixel’s original location in an image to its new location. The first method is forward warping. In this method, every point in the original image is transformed and sent to its new location. However, this mode of warping can result in holes and splattering. The better approach is to perform inverse warping. This algorithm goes through every pixel in the new, transformed image, undoes the transformation, and figures out which original pixel to grab. If the original pixel happens to fall between two pixels, simply interpolate the source image.

fig:

**Note:**
The most problem occurs when: the scene is dynamic or there is  occlusion between target and source images or surface is Lambertian.


                             
## Summary

The authors present a unsupervised and end to end method for novel view synthesis image by CNN and also it does not need pose information, that it would be a part of learning framework. The propose network has two parts: **depth predection** network and **pose** network. The auther improves  the robustness of learning pipline by adding a **explaniability mask** network (for problems as mention in prerequest). **Depth predection** network is based on DispNet that is mainly an encoder-decoder with skip connectiona and multi-scale side prediction. The **pose** and **explanability mask** network share five first convolution layers then branch out to pose output  and explainability mask, that followed by five deconvolution layer with multi scale predection. 


The view synthesis objective can be formulate as :

 $$ l_{us} = \sum_{s}\sum_{p}| I_{t}(p) - \hat{I_{s}}(p)|$$

but output of explainability mask is per_pixel softmax $$\hat{E_{s}}$$ for each target source pair:

 $$ l_{us} = \sum_{s}\sum_{p}\hat{E_{s}}| I_{t}(p) - \hat{I_{s}}(p)|$$

beacuse the network is unsupervised, then it is always predecting $$\hat{E_{s}$$ to be zero, so we add a regularization term to out loss.

There is come out the other problem when :


Then final objective is :

 $$ l_{final} =  \sum_{l}\hat{l_{us}} + \lambda_{s}\hat{l_{smooth}} + \lambda_{e} \sum_{s}l_{reg}\E_{s}$$

where $$l$$ is index over different image scale, $$s$$ index over source images and $$\lambda_{s}$$ and  $$\lambda_{e}$$ are the weighting for  depth smoothness loss and explainability regularization. 





![](/deep-learning/images/icstn/sc1.png)
 




## Experiments and results

Depth result :
![](/deep-learning/images/icstn/sc3.png)
![](/deep-learning/images/icstn/sc4.png)
![](/deep-learning/images/icstn/sc4.png)

Pose estimation :
![](/deep-learning/images/icstn/sc4.png)


explainability mask result : 
![](/deep-learning/images/icstn/sc4.png)

## Code

The code is available at [https://github.com/ericlin79119/IC-STN](https://github.com/ericlin79119/IC-STN). It uses Python/Tensorflow.

[1] M. Jaderberg, K. Simonyan, A. Zisserman, et al. Spatial transformer networks. In Advances in Neural Information Processing Systems, pages 2017–2025, 2015
