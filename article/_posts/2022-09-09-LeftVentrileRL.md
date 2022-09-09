---
layout: review
title: "MIDL 2022"
tags:
author: "Nathan Painchaud Thierry Judge Antoine Théberge"
cite:
    authors: ""
    title:   ""
    venue:   ""
pdf: ""
---


# Highlights

- [Left Ventricle Contouring in Cardiac Images Based on Deep Reinforcement Learning](#LeftVentricleRL)

# <a name="LeftVentricleRL"></a> Left Ventricle Contouring in Cardiac Images Based on Deep Reinforcement Learning
Segmentation has often been posed as a supervised learning problem. However, contouring the left ventricle can be akin to moving a paintbrush, which can be nicely formulated as a control learning problem. In this paper, which got the 2nd position for the Best Paper Award at MIDL 2022, the authors propose to use reinforcement learning to learn the segmentation process for the left ventricle in the human heart.

## Method

![](/article/images/LeftVentricleRL/fig1.jpeg)

Figure 1 sums up nicely the contouring method. During training, at first, a random point is selected on the ground-truth. The agent then moves around by selecting one of the actions. The episode stops once the agent have moved for as many points there are on the ground-truth contour. The reward at each step is given by

$$
  r_t = -|p_t - {p_t}'|,
$$

where $${p_t}'$$ is the _corresponding position on the true contour_ [sic] (see dataset section for explanation). If the agent steps out of the image, a very negative reward is given and the episode stops. PPO is used to train the agent.

During training, a random point is selected on the ground-truth as a starting position. However, this would be infeasible at test time. The authors therefore train a network which takes a input a volume and outputs a coordinate that corresponds to the starting point. The loss used for training is the mean mininum distance between the predictions and the points on the contours. Interestingly, the following is mentioned in the paper:

> After inspecting all the cardiac images, we found that part of true contours always falls into the upper-right quadrant without exception. Therefore, we only focus on the upper-right sub-image with uniform size for each cardiac image to reduce the input size of the landing spot generator and improve training efficiency. 

Finally, at test time, the agent stops once it is in a 3x3 vicinity of its starting point.

## Dataset

> Our dataset is provided by the radiology department of a “triple-A-level” hospital in Beijing, China.

The dataset has 100 MRIs (32/8/60 train/val/test) of 60 patients. The images have varying sizes and were annotated (the contour was drawn) by a radiologists specialized in cardiovascular imaging. The contours were then used as counter-clockwise sequences for training. 

## Results

![](/article/images/LeftVentricleRL/tab1.jpeg)
![](/article/images/LeftVentricleRL/fig2.jpeg)
