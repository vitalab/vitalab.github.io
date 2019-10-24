---
layout: review
title:  "Show, Attend and Tell: Neural Image Caption Generation with Visual Attention"
tags:   deep-learning CNN RNN LSTM essentials
author: "Pierre-Marc Jodoin"
pdf: "https://arxiv.org/pdf/1502.03044.pdf"
cite:
  authors: "Kelvin Xu, Jimmy Lei Ba, Ryan Kiros, Kyunghyun Cho, Aaron Courville, Ruslan Salakhutdinov, Richard S. Zemel,Yoshua Bengio "
  title:   "Show, Attend and Tell: Neural Image Caption Generation with Visual Attention"
  venue:   "ICML 2015"
---

## Introduction

One of the most highly cited attention paper.  The goal is to generate a caption (sequence of words) from an image (a 2D array of pixels). As mentioned in [this blog](https://shadowthink.com/blog/research/2017/06/11/review-image-captioning#m-rnn), this method generalizes over previous recurrent image-to-text methods.

# Description

As shown in the following 2 figures


![](/article/images/attention/sc01.jpg)

![](/article/images/attention/sc04.jpg)



 the method processes an image with a CNN.  This results into a set of $$14 \times 14 \times 512$$ feature maps after the fourth convolutional layer.  These feature maps are then fed to an LSTM.  The output of this LSTM is two fold : 1) the prediction of a word and 2) a $$14 \times 14$$ mask with values between 0 and 1.  This mask is called the **attention** associated to the next predicted word.  The attention mask is then multiplied element wise to the feature maps which is fed back into the input of the LSTM.  The system stops iterating when the LSTM generates the symbol "EOS" (End of Sentence).

## Results

Results are cool!

![](/article/images/attention/sc02.jpg)

![](/article/images/attention/sc03.jpg)


# Code

The code can be [found here](https://github.com/yunjey/show-attend-and-tell).


