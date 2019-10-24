---
layout: review
title:  "On the importance of single directions for generalization"
tags:   deep-learning deep-learning
author: Carl Lemaire
pdf:    https://openreview.net/forum?id=r1iuQjxCZ&noteId=r1On1W5xf
cite:
  authors: "Ari S. Morcos, David G.T. Barrett, Neil C. Rabinowitz, Matthew Botvinick"
  title:   "On the importance of single directions for generalization"
  venue:   "ICLR 2018"
---

<style>
img
{
-webkit-box-shadow: 0px 0px 8px 4px rgba(0,0,0,0.29);
-moz-box-shadow: 0px 0px 8px 4px rgba(0,0,0,0.29);
box-shadow: 0px 0px 8px 4px rgba(0,0,0,0.29);
margin: 1em 0 1em 0;
}
</style>

**Is a _cat neuron_ a good thing?** A paper from Deep Mind that explores the relationship between _class selectivity_ and generalization.

In a layer that has high _class selectivity_, a neuron will fire up for a class while other neurons are off. The activation vector is thus pointing in a _single direction_. In networks that rely on single directions, random ablation of neurons will greatly affect the network's output. Thus, the authors use random ablation as their experimentation method for testing their hypotheses.

# Generalization and single directions

* Networks that rely more on single directions tend to have lower generalization capability
* Introducing noise in labels forces the network to memorize

![](/article/images/directions/fig1.jpg)

![](/article/images/directions/fig2-3.jpg)

# Single directions for model selection

* Single direction reliance is a good indicator of generalization
* Could be used instead of a validation/test set

![](/article/images/directions/fig4.jpg)

# Dropout and BatchNorm

* BatchNorm discourages reliance on single directions
* Dropout does not help beyond the dropout proportion used while training

![](/article/images/directions/fig5.jpg)

![](/article/images/directions/fig6.jpg)

# Does class selectivity make a good neuron?

* Class selectivity of single directions is uncorrelated to their importance to the network's output
* We should not analyse DNNs by looking for _cat neurons_ or other class selective neurons

![](/article/images/directions/fig7.jpg)
