---
layout: review
title: "Unsupervised Domain Adaptation using Feature-Whitening and Consensus Loss"
tags: deep-learning domain-adaptation 
author: "Pierre-Marc Jodoin"
cite:
    authors: "Subhankar Roy, Aliaksandr Siarohin, Enver Sangineto, Samuel Rota Bulo, Nicu Sebe,
    and Elisa Ricci"
    title:   "Unsupervised Domain Adaptation using Feature-Whitening and Consensus Loss"
    venue:   "arXiv:1903.03215v1"
pdf: "https://arxiv.org/pdf/1903.03215.pdf"
---


<center><img src="/article/images/fwhitening/sc01.jpg" width="700"></center>

# Summary

In this paper, the authors propose a domain adaptation method to train a deep neural net on a labeled source dataset and yet get good results on a target dataset whose visual domain is shifted WRT the one of the source dataset.  The main novelty is a so-called Domain-specific Whitening Transform (DWT) as well as a  Min-Entropy Consensus (MEC) loss which account for both the labeled source data and the non-labeled target data.  The method is illustraed in Fig.1. 


# Proposed method
## Domain-specific Whitening Transform (DWT) 

For the DWT, they replace the usual Batch Norm 

<center><img src="/article/images/fwhitening/sc02.jpg" width="250"></center> 

by a new *Batch Whitening* operation:

<center><img src="/article/images/fwhitening/sc03.jpg" width="350"></center> 

The goal of the BW is to project the feature space of both target and source distributions onto a common zero-centered hypersphere.


## Min-Entropy Consensus Loss

The second contribution of this paper is the Loss which they minimize :

<center><img src="/article/images/fwhitening/sc06.jpg" width="250"></center> 

Where the first term is the usual cross-entropy over the **labeled source** training data

<center><img src="/article/images/fwhitening/sc04.jpg" width="250"></center> 

whereas the second term is the Min-Entropy Consensus (MEC) Loss which is intended for the **target** data

<center><img src="/article/images/fwhitening/sc05.jpg" width="350"></center> 

Since the target data are unlabeled, the goal of that loss is to make sure that the prediction of two identical batches $$ B_1^t $$ and $$ B_2^t $$ more or less some noise are identical.

## Results

The method is state-of-the-art on several source-tardet dataset pairs:

<center><img src="/article/images/fwhitening/sc07.jpg" width="650"></center> 
