---
layout: review
title:  "Matching Networks for One Shot Learning"
tags:   "Deep Learning"
author: Faezeh Amjadi
pdf:    https://arxiv.org/pdf/1606.04080.pdf
cite:
  authors: "Oriol Vinyals, Charles Blundell, Timothy Lillicrap, Koray Kavukcuoglu, Daan Wierstra"
  title:   "Matching Networks for One Shot Learning"
  venue:   "--"
---

### Description

This paper has proposed a solution for small data set that suffers from overfitting and generalizing .The authors employ a metric learning which help to network to learn rapid from small data set. They apply this idea on a small set of Image Net and they get a accuracy from 87.6\% to 93.2\%.



They use the advantages of one shot learning, but for prediction on the target, they investigate a metric to found how much a unseen sample is simmilar to seen sample in a episod and this similarity can present as a weight to apply on labels.
This metric plays such as attention or a kernel function. The authors use a cosin distance on two vectors as a metric.
Suppose $(x_{i},y_{i})$ is a given (input, class) and $hat{x}$ is given input and predicted label $hat{y}$ calculated as:


$hat{y} = \sum_{i=1}^k a(hat{x},x_i) y_{i} $
 


a small support set is contain of k labell example with input x and lable y, $ S= {(x_{i},y_{i})}_{i=1}^k$ , given a new example $hat_{x}$, we want to know the probability that it is an example of a given class  P(hat{y}\hat{x},S) where P is parametrized by a neural network. Therefore S  to mapped to a classifier $ c_{s}(hat{x})$. Simply, suppose a task T has a distribution over lable sets L. They first sample a set L from task T , Then from these sample labels, They sample the support set S and a batch B. The Maching network has to minimize the prediction of lables in batch B conditioned on support set(S).

<img src="/deep-learning/images/MNet/1.png" width="500">


For a similarity metric, two embeding functions $f$ and $g$ need to take similarity on feature space X. function g has embeded $x_{i}$ independently from other elements but S could be able to effect how be embeded $hat{x}$ through function f. Then 
attention kernel calculate cosin distance on these functions ( similar to nearest neighbor).

<img src="/deep-learning/images/MNet/2.png" width="400">

 
The embeding of x_{i} is a neural network (VGG) follow by a Bi-LSTM. The function f is a neural network (VGG) and then the embeding function g applied to each element x_{i} to process the kernel for each set of S.  
Note that $hat{y}$ is a linear combination of the lables in support set.

<img src="/deep-learning/images/MNet/3.png" width="400">


<img src="/deep-learning/images/MNet/4.png" width="400">



### Results

<img src="/deep-learning/images/MNet/5.png" width="400">
<img src="/deep-learning/images/MNet/6.png" width="400">


