---
layout: review
title:  "Multi-Stage Multi-Task Neural Network for Aerial Scene Interpretation and Geolocalization"
tags:   deep-learning CNN segmentation
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1804.01322v1.pdf"
cite:
  authors: "A Marcu, D Costea, E Slusanschi, M Leordeanu"
  title:   "A Multi-Stage Multi-Task Neural Network for Aerial Scene Interpretation and Geolocalization" 
  venue:   "https://arxiv.org/abs/1804.01322"
---

The main contribution of this paper is a network that allows to do segmentation and geolocalization of arial images at the same time.  As shown in fig.1, the multi-stage multi-task (MSMT) network has 2 stages and makes 3 predictions.  

#### Stage 1

This part is first trained independantly from the rest of the system.  The goal is to segment roads

#### Stage 2 

Once stage 1 is trained, the output feature maps and then used to train 2 branches, one for **geolocalization** and one for **building segmentation** (which they call localization map). 


![](/deep-learning/images/interpPLUSgeo/sc01.png)

The segmentation loss is a combination of a cross-entropy and a dice

![](/deep-learning/images/interpPLUSgeo/sc03.png)


![](/deep-learning/images/interpPLUSgeo/sc02.png)

while the geolocalization loss is a simple l2 regression:

![](/deep-learning/images/interpPLUSgeo/sc04.png)



### Results

Results show that their method is more accurate and faster than previous methods.  Here is an illustration of their Arial image localization dataset.

![](/deep-learning/images/interpPLUSgeo/sc05.png)


![](/deep-learning/images/interpPLUSgeo/sc06.png)

![](/deep-learning/images/interpPLUSgeo/sc07.png)

![](/deep-learning/images/interpPLUSgeo/sc08.png)

