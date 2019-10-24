---
layout: review
title:  "Dynamic Edge-Conditioned Filters in Convolutional Neural Networks on Graphs"
tags:   deep-learning machine-learning CNN classification
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1704.02901.pdf
cite:
  authors: "Martin Simonovsky, Nikos Komodakis"
  title:   "Dynamic Edge-Conditioned Filters in Convolutional Neural Networks on Graphs"
  venue:   "in proc of CVPR 2017"
---

In this paper, the authors perform point cloud classification (like image classification) on graph whose configuration is not fixed.  A graph whose configuration is not fixed is one for which the vertices do not have the same number of edges.  The graph is constructed from a point cloud (typically obtained with a lidar scanner) and a pre-processing remeshing operation.

![](/article/images/cnn-on-graph/sc01.jpg)

Since the number of edges is not the same for each vertices (unlike an image for example) they propose a new type of convolution operator which involves a function $$F$$ which converts an edge label $$L$$ and the weight vector $$w$$ to a floating point value $$\Theta$$.  Note that in Fig.2, the use of $$F(L,w)$$ allows to obtain a  normal convolution (second equation).  Note that $$X$$ are feature maps, $$l$$ is the layer index, $$w^l$$ is the weight vector of layer $$l$$, and $$b^l$$ is the bias of layer $$l$$. 

![](/article/images/cnn-on-graph/sc02.jpg)
![](/article/images/cnn-on-graph/sc03.jpg)

The overall graph-CNN has the same structure than a conventional CNN except for the MaxPooling operation which involves a graph reduction algorithm ($$M^{(1)}$$ in the next figure).

![](/article/images/cnn-on-graph/sc04.jpg)



