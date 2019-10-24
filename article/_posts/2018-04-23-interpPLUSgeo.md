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

The main contribution of this paper is a network that allows to do segmentation and geolocalization of aerial images at the same time.  As shown in fig.1, the multi-stage multi-task (MSMT) network has 2 stages and makes 3 predictions.  

#### Stage 1

This part is first trained independantly from the rest of the system.  The goal is to segment roads

#### Stage 2 

Once stage 1 is trained, the output feature maps and then used to train 2 branches, one for **geolocalization** and one for **building segmentation** (which they call localization map). 


![](/article/images/interpPLUSgeo/sc01.jpg)

The segmentation loss is a combination of a cross-entropy and a dice

![](/article/images/interpPLUSgeo/sc03.jpg)


![](/article/images/interpPLUSgeo/sc02.jpg)

while the geolocalization loss is a simple l2 regression:

![](/article/images/interpPLUSgeo/sc04.jpg)



### Results

Results show that their method is more accurate and faster than previous methods.  Here is an illustration of their Arial image localization dataset.

![](/article/images/interpPLUSgeo/sc05.jpg)


![](/article/images/interpPLUSgeo/sc06.jpg)

![](/article/images/interpPLUSgeo/sc07.jpg)

![](/article/images/interpPLUSgeo/sc08.jpg)

