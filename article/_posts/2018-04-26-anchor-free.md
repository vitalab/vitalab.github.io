---
layout: review
title:  "An Anchor-Free Region Proposal Network for Faster R-CNN based Text Detection Approaches"
tags:   deep-learning CNN localization
author: "Frédéric Branchaud-Charron"
pdf: "http://arxiv.org/pdf/1804.09003.pdf"
cite:
  authors: "Zhuoyao Zhong, Lei Sun, Qiang Huo"
  title:   "An Anchor-Free Region Proposal Network for Faster R-CNN based Text Detection Approaches"
  venue:   "arxiv:1804.09003"
---

An important sub-domain of localization is text detection. While methods in localization use anchors, it's often tricky to use those in text detection because the boxes are rotated and the labels are tiny. This problem is shown in fig. 3 where small objects are not detected by a standard RPN.

![](/article/images/anchor-free/fig3.jpg)


### Model

To resolve this issue, the authors propose a multi-scale network based on FPN without anchor. The network is shown in fig. 2. The **detection module** is the same as in Faster R-CNN, but it outputs 8 coordinates per box.

![](/article/images/anchor-free/fig2.jpg)


To train this network, they compute the loss of all labels for all 3 stages. The localization loss is a Smooth L1 as in Faster R-CNN.

### Results

The authors show great results on ICDAR-2017, 2015 and 2013.

![](/article/images/anchor-free/table3.jpg)


---


![](/article/images/anchor-free/fig4.jpg)
