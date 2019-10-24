---
layout: review
title: "Speed/accuracy trade-offs for modern convolutional object detectors"
tags: deep-learning CNN localization essentials survey benchmarking
author: "Pierre-Marc Jodoin"
cite:
    authors: "J Huang, V Rathod, C Sun, M Zhu, A Korattikara, A Fathi, I Fischer, Z Wojna, Y Song, S Guadarrama, K Murphy"
    title:   "Speed/accuracy trade-offs for modern convolutional object detectors"
    venue:   "CVPR 2017"
pdf: "http://openaccess.thecvf.com/content_cvpr_2017/papers/Huang_SpeedAccuracy_Trade-Offs_for_CVPR_2017_paper.pdf"
---

## Summary
This is a survey/benchmarking paper focused on localization methods.  This paper is a guide for selecting
a detection architecture that achieves the right speed/memory/accuracy balance by investigating various ways to
trade accuracy for speed and memory usage in object detection CNN methods.  In that purpose, they implemented three "meta-architectures":

- SSD (Single Shot Detector)
- Faster R-CNN
- R-FCN

different feature extractors :

- Vgg16
- Resnet-101
- Inception v2
- Inception Resnet v2
- MobileNet

tested the impact of using various number of box proposals (between 10 and 300), and the input image size (300 or 600).


## Experimental results

![](/article/images/objDetector17/sc01.jpg)
<div style="text-align:center">
<img src="/article/images/objDetector17/sc03.jpg" width="500">
</div>
![](/article/images/objDetector17/sc04.jpg)


## Conclusion

- Fig.4a shows that **Faster-RCNN + inception ResNet v2** is the top performing configuration.
- Fig.4b shows that an input resolution of 600 is better than 300, especially when dealing with small objects.
- Fig.6 shows that using more than **50 box proposals** does not improve mAP while requiring more processing power. 
- Table 4 shows that their top method achieves a mAP of 0.347 on COCO while ensemble methods reach 0.416, the best result ever.
