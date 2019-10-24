---
layout: review
title:  "Segment-before-Detect: Vehicle Detection and Classification through Semantic Segmentation of Aerial Images"
tags:   deep-learning classification, traffic, deep-learning, remote-sensing, segmentation, CNN
author: Charles Authier
pdf:    http://www.mdpi.com/2072-4292/9/4/368/pdf
cite:
  authors: "Nicolas Audebert, Bertrand Le Saux, and Sébastien Lefèvre"
  title:   "Segment-before-Detect: Vehicle Detection and Classification through Semantic Segmentation of Aerial Images"
  venue:   "Semantic Segmentation of Aerial Images. Remote Sens. 2017, 9, 368."
---

### Description
They proposed a three-step *segment-before-detect* method for vehicle extraction and classification in very high-resolution remote-sensing.
- Segmentation.
- Vehicle detection (regression on the bounding boxes of connected components).
- Object-level classification.

<img src="/article/images/vfs/vfs_model.jpg" width="600">

#### Models
Segmentation: SegNet (pre-train on VGG16 on ImageNet base on conclusion of [^fn]).

Classification: LeNet-5, AlexNet and VGG16.

#### Datasets
- VEDAI (Box/vehicle class) [^fn2]
- ISPRS Potsdam (Segmentation) [^fn3]
- NZAM/ONERA Christchurch (Box/detection) [^fn4]

<img src="/article/images/vfs/vfs_ds.jpg" width="600">

<img src="/article/images/vfs/vfs_ds_table.jpg" width="600">

### Experiments/Results
Segmentaiton: Potsdam(cars) = 95.1% and Christchurch(Vehicle) = 61.9%

<img src="/article/images/vfs/vfs_seg.jpg" width="600">

Detection:

<img src="/article/images/vfs/vfs_det_meth.jpg" width="600">

<img src="/article/images/vfs/vfs_det_table.jpg" width="600">

<img src="/article/images/vfs/vfs_det.jpg" width="600">

Classification:

<img src="/article/images/vfs/vfs_class.jpg" width="600">

 Transfer Learning for Vehicle Classification:

<img src="/article/images/vfs/vfs_trans.jpg" width="600">

<img src="/article/images/vfs/vfs_trans_table.jpg" width="600">

Traffic Density Estimation:

<img src="/article/images/vfs/vfs_dens.jpg" width="600">

<img src="/article/images/vfs/vfs_dens_error.jpg" width="600">

***

[^fn]: Audebert, N.; Le Saux, B.; Lefèvre, S. Semantic Segmentation of Earth Observation Data Using Multimodal and Multi-scale Deep Networks. In Proceedings of the Computer Vision—ACCV, Taipei, Taiwan, 20–24 November 2016; Springer: Cham, Switzerland, 2016; pp. 180–196.
[^fn2]: Razakarivony, S.; Jurie, F. Vehicle Detection in Aerial Imagery: A small target detection benchmark. J. Vis. Commun. Image Represent. 2016, 34, 187–203.
[^fn3]: Rottensteiner, F.; Sohn, G.; Jung, J.; Gerke, M.; Baillard, C.; Benitez, S.; Breitkopf, U. The ISPRS benchmark on urban object classification and 3D building reconstruction. ISPRS Ann. Photogramm. Remote Sens. Spat. Inf. Sci. 2012, 1, 293–298.
[^fn4]: Randrianarivo, H.; Saux, B.L.; Ferecatu, M. Urban Structure Detection with Deformable Part-Based Models. In Proceedings of the 2013 IEEE International Geoscience and Remote Sensing Symposium—IGARSS, Melbourne, Australia, 21–26 July 2013; pp. 200–203.
