---
layout: review
title: "Cascade R-CNN: Delving into High Quality Object Detection"
tags: deep-learning CNN localization
author: Frédéric Branchaud-Charron
cite:
    authors: "Zhaowei Cai, Nuno Vasconcelos"
    title:   "Cascade R-CNN: Delving into High Quality Object Detection"
    venue:   "CVPR 2018"
pdf:   "https://arxiv.org/pdf/1712.00726.pdf"
---

The basic idea of this paper is to train multiple detection heads with multiple IoU thresholds.
The output of the previous detector is fed to the next as a **resampling** mechanism.

![](/article/images/cascade-rcnn/fig3.jpg)

This method gives better results, especially for high IoUs.

![](/article/images/cascade-rcnn/table1.jpg)

This approach is somewhat expensive as it adds 100M parameters and is slower by 0.03 seconds on a FPN during inference. (0.115s vs 0.14)

![](/article/images/cascade-rcnn/table6.jpg)


Code is available here : https://github.com/zhaoweicai/cascade-rcnn
