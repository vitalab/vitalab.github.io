---
layout: review
title:  "Joint Learning from Earth Observation and OpenStreetMap Data to Get Faster Better Semantic Maps"
tags:   deep-learning deep-learning, segmentation,
author: Charles Authier
pdf:    https://arxiv.org/pdf/1705.06057
cite:
  authors: "Nicolas Audebert (Palaiseau, OBELIX), Bertrand Le Saux (Palaiseau), Sébastien Lefèvre (OBELIX)"
  title:   "Joint Learning from Earth Observation and OpenStreetMap Data to Get Faster Better Semantic Maps"
  venue:   "EARTHVISION 2017 IEEE/ISPRS CVPR Workshop"
---


They propose to use different cases and deep network architectures to leverage OpenStreetMap data for semantic labeling of aerial and satellite images.
Especially, the fusion-based architectures and coarse-to-fine segmentation to include the OpenStreetMap layer into convolutional networks.
They used on two public datasets: ISPRS Potsdam and DFC2017.
In the end, they show that OpenStreetMap data can efficiently be integrated into the vision-based deep learning models and that it significantly improves both the accuracy performance and the convergence speed of the networks.


### Segmentation Network

![](/article/images/osm_faster/model_osm.jpg)

### Binary Vs. Signed Distance Transform (SDT)

![](/article/images/osm_faster/sdt_osm.jpg)

* Binary: For each raster, they have an associated channel in the tensor which is a binary map denoting the presence of the raster class in the specified pixel.
* SDT: For each raster associated channel corresponding to the distance transform d, with d > 0 if the pixel is inside the class and d < 0 if not.

## Experiments

![](/article/images/osm_faster/res_osm.jpg)

## Problems
* For segmentation, we can only use roads, buildings and vegetation landuse OSM class.
* They use more recent OSM data than the ISPRS dataset (some buildings are on OSM and not on Potsdam).
* Using different channel with the OSM data can quickly bust all the memory.
