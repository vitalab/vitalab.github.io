---
layout: review
title:  "Cascaded Transforming Multi-task Networks For Abdominal Biometric Estimation from Ultrasound "
tags:   deep-learning segmentation CNN multi-task
author: Pierre-Marc Jodoin  
pdf:    https://arxiv.org/pdf/1710.04773.pdf
cite:
  authors: "Matthew D. Sinclair, Juan Cerrolaza Martinez, Emily Skelton, Yuanwei Li, Christian F. Baumgartner, Wenjia Bai, Jacqueline Matthew, Caroline L. Knight, Sandra Smith, Jo Hajnal, Andrew P. King, Bernhard Kainz, Daniel Rueckert"
  title:   "Cascaded Transforming Multi-task Networks For Abdominal Biometric Estimation from Ultrasound "
  venue:   "MIDL 2018"
---

# Description

In this paper, the authors propose a method to measure biometrics from fetal ultrasound (US), in particular the abdominal circumference (AC) extracted from an ellipse.  To do so, they propose a simple CNN architecture that resemble an FCNN but at the same time regresses the parameters of the ellipse.  C.f. Fig.1 for more details.


![](/article/images/cascadedFCNUS/sc01.jpg)


# Implementation details

Since their network aims to segment the image AND recover the parameters of the ellipse, their method minimizes the following multi-task loss 

![](/article/images/cascadedFCNUS/sc05.jpg)

where $$ L_s $$ is the usual crossentropy:

![](/article/images/cascadedFCNUS/sc02.jpg)

and $$ L_r $$ is an L2 loss of the ellipse parameters:

![](/article/images/cascadedFCNUS/sc04.jpg)

where $$ \sigma $$ is a 5-D vector contianing the ellipse parameters $$(a,b,c_x,c_y,\phi)$$

![](/article/images/cascadedFCNUS/sc03.jpg)


In order to further improve results, they implemented a cascaded network.  Instead of implementing a usual cascade (c.f. Fig.2(a)), they concatenate the output of the first network to a rotated version of the input image (c.f. Fig.2(b)).

![](/article/images/cascadedFCNUS/sc06.jpg)

# Results

Their method beats results from FCN and cascaded FCN while being within the inter-obs variation.

![](/article/images/cascadedFCNUS/sc08.jpg)
![](/article/images/cascadedFCNUS/sc07.jpg)



