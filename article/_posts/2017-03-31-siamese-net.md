---
layout: review
title:  "Learning a similarity metric discriminatively, with application to face verification"
tags:   deep-learning CNN siamese
author: Frédéric Branchaud-Charron
pdf:   "http://yann.lecun.com/exdb/publis/pdf/chopra-05.pdf"
cite:
  authors: "Chopra, S., Hadsell, R., & LeCun, Y."
  title:   "Learning a similarity metric discriminatively, with application to face verification"
  venue:   "Computer Vision and Pattern Recognition, 2005. CVPR 2005"
---

## Summary

Siamese networks were in the firsts networks to use multiple inputs. The idea behind is to map images to a lower dimension and then compare them using a standard distance metric (like euclidean distance) to compare them. The process is similar to PCA-based approach. The main drawback of PCA-based approach is that they are very sensitive to transformation like scaling, rotation, etc. Siamese networks are able to overcome these issues. To train this type of network, you have to provide true and false pair of data to the network.

The authors explain the loss as follow :
```
The Loss L is designed in such a way that its minimization will decrease the energy of
genuine pairs (true pairs) and increase the energy of impostor pairs (false pair).```

<img src="/article/images/siameses/figure_1.jpg" width="400">
