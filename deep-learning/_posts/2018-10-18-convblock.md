---
layout: review
title:  "CBAM: Convolutional Block Attention Module"
tags:   deep-learning CNN attention
author: Frédéric Branchaud-Charron
pdf: http://openaccess.thecvf.com/content_ECCV_2018/papers/Sanghyun_Woo_Convolutional_Block_Attention_ECCV_2018_paper.pdf
cite:
  authors: "Sanghyun Woo , Jongchan Park , Joon-Young Lee, In So Kweon"
  title:   "CBAM: Convolutional Block Attention Module"
  venue:   "ECCV 2018"
---


This paper builds upon Squeeze-and-Excite (S&E) by adding spatial attention in addition to channel attention.

![](/deep-learning/images/convblock/fig1.png)

They modified the **S&E Module** by adding an Avg pooling before applying the MLP to generate the channel attention map.

The **Spatial Attention Module** is pretty similar, they first concatenate the output of a Max and Avg pooling layers. They then combine them using a Conv layer to produce the attention map.

![](/deep-learning/images/convblock/fig2.png)

---
They tested their method on ImageNet, COCO (+2% mAP) and Pascal VOC 2007 (+2% mAP).

![](/deep-learning/images/convblock/table5.png)

---
Their method is quite powerful as their attention maps better segment the object in the images than previous works.

![](/deep-learning/images/convblock/fig4.png)
