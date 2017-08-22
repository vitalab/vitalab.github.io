---
layout: review
title: "Pixelwise Instance Segmentation with a Dynamically Instantiated Network"
tags: deep-learning CNN segmentation crf instance-segmentation
cite:
    authors: "Anurag Arnab and Philip H.S Torr"
    title:   "Pixelwise Instance Segmentation with a Dynamically Instantiated Network"
    venue:   "CVPR 2017"
pdf:   "https://arxiv.org/pdf/1704.02386.pdf"
---

In this paper, the authors use localization and semantic segmentation to perform instance segmentation.

Their end-to-end network, which outputs a variable number of instances per input image, begins with an initial semantic segmentation module. The following, dynamic part of the network, then uses information from an object detector and a Conditional Random Field (CRF) model to distinguish different instances.

An important note is that you need to guess $$D$$ the number of instances in the image. 

They did some work on the loss function to avoid ordering error. In other models, labelling the first person $$2$$ and the first one $$1$$ would be an error. (Sec 3.4)

The CRF takes three terms. First, the box term encourages a pixel to be assigned to a box if it's inside of it. Second, the Global term which assign a segmented pixel without box to an instance. Finally, the Shape term which uses prior shapes to assign pixels. This term helps with merged objects.

To train the network, they train the segmentation part first and then finetune with the instance segmentation network. The RPN is not trained.

The proposed method is state of the art for a high IoU threshold (> 0.7) on PASCAL VOC and SBD.
