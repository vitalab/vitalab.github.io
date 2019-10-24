---
layout: review
title:  "Simple Does It: Weakly Supervised Instance and Semantic Segmentation"
tags:   deep-learning CNN segmentation weakly-supervised
author: "Pierre-Marc Jodoin"
pdf: "http://openaccess.thecvf.com/content_cvpr_2017/papers/Khoreva_Simple_Does_It_CVPR_2017_paper.pdf"
cite:
  authors: "Anna Khoreva, Rodrigo Benenson, Jan Hosang, Matthias Hein, B Schiele" 
  title:   "Simple Does It: Weakly Supervised Instance and Semantic Segmentation"
  venue:   "CVPR 2017"
---

## Introduction
 Starting from weak supervision in the form of bounding box detection annotations, they proposed a new approach that does not require modification of the segmentation training procedure.  The method consist in recursive training of convnets for weakly supervised semantic labelling where the GT at each round of training is the segmentation results of the method obtained at the previous round.

![](/article/images/simpleDoesIt/sc02.jpg)

## Methods

They proposed 4 variants :

1. a **naive** method that does not work (as in Fig.2)
2. a **box** method similar to **naive** but that forces the results of the method at the end of each round to certain conditions :
* any pixel outside the box annotation should be reset as background
* when the result is 50% times smaller than the initial bounding box, the result is set back to the initial bounding box
* they fine tune results with a CRF.
3. a **box-i** method identical to **box**  but with ignored pixels between the boundary and the middle of the bounding boxes (c.f. Fig.3).
4. a **grab-cut/MCG** method that gives a better initialization (c.f. Fig.3)

![](/article/images/simpleDoesIt/sc03.jpg)


## Results

They used the DeepLab network for segmentation.

Results on PascalVOC and COCO datasets are surprisingly good

![](/article/images/simpleDoesIt/sc05.jpg)

![](/article/images/simpleDoesIt/sc06.jpg)


![](/article/images/simpleDoesIt/sc07.jpg)



