---
layout: review
title:  "Training of Convolutional Networks on Multiple Heterogeneous Datasets for Street Scene Semantic Segmentation"
tags:   deep-learning, classification, bounding-boxes, segmentation
author: Charles Authier
pdf:  https://arxiv.org/pdf/1803.05675v2
cite:
  authors: "Panagiotis Meletis, Gijs Dubbelman"
  title:   "Training of Convolutional Networks on Multiple Heterogeneous Datasets for Street Scene Semantic Segmentation"
  venue:   " 	IEEE Intelligent Vehicles 2018, 8 Jully 2018"
---

**Full implementation code for training, evaluation and inference, and
the extra annotated datasets will be made publicly available [here](https://github.com/pmeletis/hierarchical-semantic-segmentation).**

## Idea
A convolutional network with hierarchical classifiers for per-pixel semantic segmentation, which is able to be trained on multiple, heterogeneous datasets and exploit their semantic hierarchy.
The network is the first to be simultaneously trained on three different datasets: *Cityscapes*, *GTSDB* and *Mapillary Vistas*.
The network is able to handle different class imbalances and different annotation types (per-pixel and bounding-box).
Their implementation achieves inference rates of 17 fps at a resolution of 520x706 for 108 classes.

![](/deep-learning/images/DOTA/dota_example.png)

## Initiative
To incrase the number of recognizable classes they use existing auxiliary datasets only for new (sub)classes. In that case, all classes of *GTSDB* are subclasses of the traffic sign class in *Cityscapes*. The straightforward approach of combining classes from both datasets in a conventional flat classifier is infeasible, since a traffic sign pixel cannot have different labels depending on the dataset it comes from.

To summarize, the contributions of this work to per-pixel semantic segmentation are:
* A methodology for combined training on datasets with disjoint, but semantically connected, label spaces.
* A modular architecture of hierarchical classifiers that can replace the classification stage in modern convolutional networks.

![](/deep-learning/images/DOTA/dota_dataset.png)

note: DOTA consists of 15 different categories but only 14 main categories, because small vehicles and large vehicle are both sub-categories of the broad class of vehicle.

## Category
- plane
- ship
- storage tank
- baseball diamond
- tennis court
- basketball court
- ground track field
- harbor
- bridge
- large vehicle
- small vehicle
- helicopter
- roundabout
- soccer ball field
- basketball court

![](/deep-learning/images/DOTA/dota_classes.png)

![](/deep-learning/images/DOTA/dota_samples.png)

## Annotation

The annotated images by a quadrilateral bounding boxes, which can be denoted as "x1, y1, x2, y2, x3, y3, x4, y4" where (xi, yi) denotes the positions of the oriented bounding boxes' vertices in the image.

```bash
'imagesource':imagesource
'gsd':gsd
x1, y1, x2, y2, x3, y3, x4, y4, category, difficult
x1, y1, x2, y2, x3, y3, x4, y4, category, difficult
...						
```
note: 'gsd' is the ground sample distance, the physical size of one image pixel, in meters.

![](/deep-learning/images/DOTA/dota_HOBB.png)

## Evaluation

They provide results for state-of-the-art object detection algorithms on DOTA and a comparaison with horizontal bounding boxes (HBB) and oriented bounding boxes (OBB).

#### Models

* Faster R-CNN
* R-FCN
* YOLOv2
* SSD

#### Results

![](/deep-learning/images/DOTA/dota_r_HBB.png)
![](/deep-learning/images/DOTA/dota_r_OBB.png)
