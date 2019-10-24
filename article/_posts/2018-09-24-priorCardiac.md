---
layout: review
title: "Automatic 3D bi-ventricular segmentation of cardiac images by a shape-constrained multi-task deep learning approach"
tags: deep-learning CNN segmentation cardiac  medical 
author: Pierre-Marc Jodoin
cite:
    authors: "J. Duan, G. Bello, J. Schlemper, W. Bai, T. J. W Dawes, C. Biffi, A. de Marvao, G. Doumou, D.P. O’Regan, D. Rueckert"
    title:   "Automatic 3D bi-ventricular segmentation of cardiac images by a shape-constrained multi-task deep learning approach"
    venue:   "arXiv:1808.08578, 2018"
pdf: "https://arxiv.org/pdf/1808.08578.pdf"
---

### Introduction

![](/article/images/priorCardiac/sc01.jpg)

This paper proposes a method for MRI cardiac segmentation built upon a shape prior.  The method seems to work well both on high and low resolution images (i.e. 3D images with small and large inter-slice thickness).  The overall method is illustrated in Figure 2.  In short, the method first segments the input image and locates 6 anatomical points as shown in figure 3.  Note that the full 3D volume is fed to the Network but only conv2D operations are used in the rest of the network.  Then, the anatomical points are used to register the 3D shape prior which is then combined to the segmented result. 


![](/article/images/priorCardiac/sc02.jpg)

### Further details. 

The loss involves 3 terms:

![](/article/images/priorCardiac/sc03.jpg)

where $$L_D(W)$$ is the segmentation loss that evaluates spatial overlap
with ground-truth labels and $$ L_L(W) $$ is the landmark associated loss
for predicting landmark locations.

![](/article/images/priorCardiac/sc04.jpg)

![](/article/images/priorCardiac/sc05.jpg)  

### Results 

Results are convincing both on high and low resolution images.  The method also seems to out perform state-of-the-art methods.


![](/article/images/priorCardiac/sc06.jpg)  

![](/article/images/priorCardiac/sc07.jpg)  
