---
layout: review
title: "Using Generative Models for Pediatric wbMRI"
tags: GAN, medical, segmentation
author: "Pierre-Marc Jodoin"
cite:
    authors: "Alex Chang Vinith M. Suriyakumari, Abhishek Moturu, Nipaporn Tewattanarat, Andrea Doria, Anna Goldenberg"
    title:   "Using Generative Models for Pediatric wbMRI"
    venue:   "MIDL 2020"
pdf: "https://openreview.net/pdf?id=BXC_fpbLe"
---


# Highlights

Using GANs to segment tumors from whole body MRI.

![](/article/images/pediatricGAN/sc1.jpg)
# Introduction

This is a very simple paper with cute idea.  Not clear how well it works in reality but at least it is worth mentioning.  Segmentation is done as follows

* First a GAN is trained on a wbMRI of *healthy subjects* (c.f. fig 1 for results of 4 different GANs)
* Second a real wbMRI with a tumor is considered.  With it, they reproduce the latent vector which produces the synthetic image which is the most similar to that of the real image
* They subtract the synthetic from the real image.  This results into a black image everywhere except where the tumor is.

# Results

Results are illustrated in fig.2.  They get better results than an [old] watershed method.

![](/article/images/pediatricGAN/sc2.jpeg)

Also, StyleGAN2 gets very nice results as reported by the expert score in Table 1.

