---
layout: review
title: "Boundary-aware Instance Segmentation"
tags: deep-learning CNN instance-segmentation
cite:
    authors: "Z. Hayder, X. He and M. Salzmann"
    title:   "Boundary-aware Instance Segmentation"
    venue:   "CVPR 2017"
pdf:   "https://infoscience.epfl.ch/record/227439/files/HayderHeSalzmannCVPR17.pdf"
---

In this paper, the authors propose a **boundary-aware** method which is resilient to error from the RPN. Most methods use a RPN to extract boxes and then estimate a binary mask to perform instance segmentation. Those methods suffer from the innacuracy of the RPN. 
To resolve this problem, the authors propose a new representation which is based on the distance between the pixel and the nearest boundary.


The authors can retrieve the object by doing an inverse-distance transform. 

