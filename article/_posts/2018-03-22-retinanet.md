---
layout: review
title:  "RetinaNet: Focal Loss for Dense Object Detection"
tags:   deep-learning CNN localization
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1708.02002.pdf"
cite:
  authors: "T-Y Lin, P Goyal, R Girshick, K He, P Dollár"
  title:   "Focal Loss for Dense Object Detection" 
  venue:   "IEEE International Conference on Computer Vision (ICCV), 2017 "
---


The best object detectors are based on a two-stage approach popularized by R-CNN, where a classifier is applied to a sparse set of candidate object locations. In contrast, one-stage detectors (like Yolo and ssd) that are applied over a regular, dense sampling of possible object locations have the potential to be faster and simpler, but have trailed the accuracy of two-stage detectors.

Authors argue that one stage methods suffer from class imbalance.  They propose a solution by using a new loss call the **Focal Loss** as in Fig.1.

![](/article/images/retinanet/sc01.jpg)

The main advantage of the focal loss is to give a near zero loss to the well classified samples whose probability are not close to one.  


The proposed architecture is a pyramid net, somehow similar to a unet but with skipconnections and with an output at each level of the pyramid. 

![](/article/images/retinanet/sc03.jpg)

### Results

Results show that their method is more accurate and faster than previous methods.

![](/article/images/retinanet/sc02.jpg)

![](/article/images/retinanet/sc04.jpg)


