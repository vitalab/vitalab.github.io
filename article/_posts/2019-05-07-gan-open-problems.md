---
layout: review
title: "Open Questions about Generative Adversarial Networks"
tags: deep-learning GAN
author: "Carl Lemaire"
cite:
    authors: "Augustus Odena"
    title:   "Open Questions about Generative Adversarial Networks"
    venue:   "Distill"
pdf: "https://distill.pub/2019/gan-open-problems"
---

In this article, the author explores open questions about Generative Adversarial Networks, a largely mysterious class of models.
The author points to research directions in the subfield of GANs that are exciting according to the Google Brain team.

# Given a distribution, what can we say about how hard it will be for a GAN to model that distribution?

* Perform computations on dataset to find, e.g. easy for a GAN, hard for a VAE
* What do we mean by ‘model the distribution’? Are we satisfied with a low-support representation, or do we want a true density model?
* Are there distributions that a GAN can never learn to model?
* Are there distributions that are learnable for a GAN in principle, but are not efficiently learnable?

Suggestions for solutions:

* Synthetic Datasets allows for systematic study
* Modify Existing Theoretical Results. (Try to apply unimodal resuts to multi-modal)

# How can GANs be made to perform well on non-image data?

* Text (discrete data). GAN results are not competitive with likelihood-based.
* Graphs (structured data).
* Audio. Promising, but no results as impressive as for images.

Suggestions for solutions:

* RL?
* Fundamental research

# How Should we Evaluate GANs and When Should we Use Them?

* Evaluation
    * Many proposals, little consensus
    * Sample quality instead of sample diversity
* When to use GANs?
    * Density model : No
    * Low support representation of target dataset : Yes
    * Perceptual flavor : Yes

How to evaluate on perceptual tasks:

* "Gram-Schmidt procedure for critics" (PCA on the critic activations)
* Evaluate on humans; try to predict human answers

# Other interesting questions discussed

* What is the Relationship Between GANs and Adversarial Examples?
* What are the trade-offs between GANs and other generative models?
* What can we Say About the Global Convergence of GAN Training?
* How does GAN Training Scale with Batch Size?
