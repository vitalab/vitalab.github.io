---
layout: review
title:  "Building Instance Classification Using Street View Images"
tags:   deep-learning CNN, classification, deep-learning, remote-sensing
author: Charles Authier
pdf:    https://arxiv.org/pdf/1802.09026
cite:
  authors: "Jian Kang, Marco Körner, Yuanyuan Wang, Hannes Taubenböck, Xiao Xiang Zhu"
  title:   "Building Instance Classification Using Street View Images"
  venue:   "Submited in ISPRS Journal of Photogrammetry and Remote Sensing."
---

### Description
First, they proposed a general framework for land-use classification for individual buildings base on 8 classes: apartment, church, garage, house, industrial, office building, retail, and roof.
After that, they built a street view benchmark dataset for training building instance CNN classifiers based on the front of the structures.
This method wants to avoid plan mapping exploration or buying satellite images which are very expensive.

#### Tools
- OpenStreetMap (OSM)
- Google Maps

#### Models
- AlexNet
- VGG16
- ResNet18
- ResNet34

#### Datasets
- OSM from the lcoation (building only)
- This paper dataset (with the google street view images) [^fn]
- Places2 dataset [^fn2]

### Experiments
<img src="/article/images/street_view/methode_steetview.jpg" width="600">

First, they extract geographic information systems (GIS), such as OpenStreetMap or Google Maps, like associated GPS coordinates (latitude, longitude). Given these GPS coordinates, we can download the corresponding Google StreetView images which give an image of the front of the structures of individual buildings, that can display these specific locations by the closest panoramas (possible error: image inside the building or obstruction).

Preliminarily, they released VGG16 model trained on Places2 dataset [^fn2] to clean the street view images. All the experiments were implemented with Pytorch.

### Results
<img src="/article/images/street_view/f1score_streetview.jpg" width="600">

<img src="/article/images/street_view/overall_streetview.jpg" width="600">

#### With VGG16:
<img src="/article/images/street_view/results_streetsview.jpg" width="600">

<img src="/article/images/street_view/perfo_streetview.jpg" width="600">

### Conclusions
They chose the VGG16 to predict building instance classification maps on region and city scales. With such maps, they want to help in many innovative urban analysis.

***

[^fn]: www.sipeo.bgu.tum.de/downloads/BIC_GSV.tar.gz
[^fn2]: B.Zhou, A.Khosla, A.Lapedriza, A.Torralba, A.Oliva, Places: An image database for deep scene understanding, arXiv preprint arXiv:1610.02055 (2016).
