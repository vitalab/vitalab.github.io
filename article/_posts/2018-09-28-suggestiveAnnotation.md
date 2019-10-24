---
layout: review
title:  "Suggestive Annotation: A Deep Active Learning Framework for Biomedical Image Segmentation"
tags:   deep-learning Segmentation CNN medical
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1706.04737.pdf
cite:
  authors: "Lin Yang, Yizhe Zhang, Jianxu Chen, Siyuan Zhang, Danny Z. Chen"
  title:   "Suggestive Annotation: A Deep Active Learning Framework for Biomedical Image Segmentation"
  venue:   "MICCAI 2017"
---


### Description

The authors address the following question: *With limited effort (e.g., time) for annotation, what instances should be annotated in order to attain the best performance?* For this, they present a deep active learning framework that combines fully convolutional network (FCN) and active learning to reduce annotation effort.  The method is summarized in Figure 1.

<center><img src="/article/images/suggestiveAnnotation/sc01.jpg" width="700"></center>

<center><img src="/article/images/suggestiveAnnotation/sc02.jpg" width="700"></center>



## The method 

The method works as follows:

1. Start with a small training set
2. Train a series of FCN segmentation networks such as the on in figure 2.
3. Segment a set of unannotated images with all the FCNs
4. For each unannotated image, measure at each pixel how much the FCNs disagree.  This provides an uncertainty measure as in figure 3. 
5. Select the N unannotated images with the largest amount of uncertainty
6. From those N images, select the M<N most "representative". 
7. Ask someone to manually annotate the M images and put those newly annoted images in the training set
8. GOTO 2 until uptimal accuracy reached.

NOTE: **an image is representative** when its 1024 descriptor is close to that of many other unannotated images. 

<center><img src="/article/images/suggestiveAnnotation/sc03.jpg" width="600"></center>


### Results

Their method is better than random selection (c.f. figure 5) and beat other state-of-the-art methods (c.f. Table 2) 

<center><img src="/article/images/suggestiveAnnotation/sc05.jpg" width="600"></center>
<center><img src="/article/images/suggestiveAnnotation/sc04.jpg" width="400"></center>


