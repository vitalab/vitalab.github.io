---
layout: document
title:  Foundations of diffusion networks
tags: deep-learning machine-learning diffusion
author: Jeremi Levesque
date: 26-11-2024
last_edit: 04-12-2024
level: internally
pdf_path: tutorial/documents/diffusion-reference.pdf
---

# Diffusion networks
As there's a lot of recent developments around image generation and diffusion models in general, I took a deep dive in the fundamentals of such models to be able to understand what's going on in the recent litterature. There is a super informative and brief review of the maths details of diffusion networks by [Lilian Weng's blog](https://lilianweng.github.io/posts/2021-07-11-diffusion-models/) and also another intuitive blog from [Yang Song](https://yang-song.net/blog/2021/score/) which describe another perspective on diffusion networks that was developped in parallel to the famous DDPM, the score-based generation models.

Diffusion models are a bit involved with the high volume of math required to fully understand how they came to be. Every resource I found was detailing the same equations while stepping over some steps that seemed crucial to me to fully understand how to get from one equation to another. Most of the content from the presentation comes from the resources listed at the end of the slides, but I did some of the derivations myself (please let me know if there are any consistencies or any mistakes).

This document will get updated with time as it aims to be a reference document and hopefully be digestible to be presented in a deep learning course.

