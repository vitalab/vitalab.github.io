---
layout: review
title: "More Lottery Ticket Stuff"
tags: deep-learning network-pruning
author: "Carl Lemaire"
---

[The Lottery Ticket Hypothesis](https://vitalab.github.io/article/2018/05/17/lottery-ticket-hypothesis.html) is a nice-sounding concept that seem to be inspiring quite a bit of research. This concept is related to neural network pruning, which is a pretty abstract area of research. The combination of buzz-words and very complex notions is risky, and puts peer-review to the test. In the following 5 papers, one has been accepted though peer-review.

# Rigging the Lottery: Making All Tickets Winners

* [Rigging the Lottery: Making All Tickets Winners](https://arxiv.org/abs/1911.11134); Utku Evci, Trevor Gale, Jacob Menick, Pablo Samuel Castro, Erich Elsen; Arxiv 2019.

This is a paper by Google and Deepmind folks. It has a very appealing title; when reading it, we want to know: how can we make all tickets winners? We expect the paper to answer this. Sadly, the papers never tackles this. From what I understand, "making all tickets winners" is just a way to describe the task of producing a good-performing, pruned network from any initialization. Many pruning methods do this; this paper is just another one.

However, it brings some interesting ideas to the table. To me, the most interesting idea in this paper is its proposition on how to _grow_ the network after a pruning round (the method alternates between pruning and growing, pruning more and growing less at each round).

# Understanding the generalization of ‘lottery tickets’ in neural networks

The following papers are referenced in a blog post on the Facebook AI Research blog, titled [Understanding the generalization of ‘lottery tickets’ in neural networks](https://ai.facebook.com/blog/understanding-the-generalization-of-lottery-tickets-in-neural-networks). It has been written by Ari S. Morcos and Yuandong Tian, which both worked on all those papers (either as first or last author).

[One ticket to win them all: generalizing lottery ticket initializations across datasets and optimizers](https://arxiv.org/abs/1906.02773); Ari S. Morcos, Haonan Yu, Michela Paganini, Yuandong Tian; NeurIPS 2019.

[Luck Matters: Understanding Training Dynamics of Deep ReLU Networks](https://arxiv.org/abs/1905.13405); Yuandong Tian, Tina Jiang, Qucheng Gong, Ari Morcos; Arxiv 2019.

[Playing the lottery with rewards and multiple languages: lottery tickets in RL and NLP](https://arxiv.org/abs/1906.02768); Haonan Yu, Sergey Edunov, Yuandong Tian, Ari S. Morcos; Arxiv 2019.

[Student Specialization in Deep ReLU Networks With Finite Width and Input Dimension](https://arxiv.org/abs/1909.13458); Yuandong Tian; Arxiv 2019.

![](/article/images/more-lottery/salut.png)
