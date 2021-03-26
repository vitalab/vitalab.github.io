---
layout: review
title: "Intriguing properties of neural networks"
tags: adversarial
author: "Marco Armenta"
cite:
    authors: "Christian Szegedy, Wojciech Zaremba, Ilya Sutskever, Joan Bruna, Dumitru Erhan,Ian Goodfellow, Rob Fergus"
    title:   "Intriguing properties of neural networks"
    venue:   "ICLR 2014"
pdf: "https://arxiv.org/abs/1312.6199.pdf"
---

# Highlights

The authors find two properties of neural networks.

* There is no distinction between individual high-level units and random linear combinations of high-level units.
* Existence and transferability of adversarial examples.


# On the units

Let $$x \in \mathbb{R}^m$$ be an input image and $$\phi(x)$$ the activation values of some layer. One can look at what inputs maximize the features of $$\phi(x)$$, that is:

![](/article/images/IntriguingProperties/max-can.jpg)

The authors find that many images that satisfy

![](/article/images/IntriguingProperties/max-rand.jpg)

are semantically related to each other, where $$v$$ is a random vector.

![](/article/images/IntriguingProperties/01.jpg)

![](/article/images/IntriguingProperties/02.jpg)

* This puts into question the notion that neural networks disentangle variation factors across coordinates.

# Adversarial examples

Let $$f:\mathbb{R}^m \to \{1,...,k \}$$ be a classifier with an associated loss function. For a given input $$x \in \mathbb{R}^m$$ and target label $$l \in \{1,...,k \}$$, the aim is to solve

![](/article/images/IntriguingProperties/03.jpg)

The minimizer is denoted $$D(x,l)$$. This task is non-trivial only if $$f(x) \not= l$$. The authors find an approximation of $$D(x,l)$$ by line-search to find the minimum $$c>0$$ for which the minimum $$r$$ of the following problems atisfies $$f(x+r)=l$$.

![](/article/images/IntriguingProperties/04.jpg)

* In the convex case this yields the exact solution.

# Experiments

* Existence of adversarial examples

![](/article/images/IntriguingProperties/05.jpg)

* Adversarial examples transfer to other architectures trained from scratch with different hyperparameters:

![](/article/images/IntriguingProperties/06.jpg)

* Adversarial examples transfer to other architectures trained on a disjoint training set:

![](/article/images/IntriguingProperties/07.jpg)

* Adding random noise to the input images is not as effective to misclassify samples when compared to adversarial examples generation:

![](/article/images/IntriguingProperties/08.jpg)

# Theoretical analysis

![](/article/images/IntriguingProperties/09.jpg)

![](/article/images/IntriguingProperties/10.jpg)

![](/article/images/IntriguingProperties/11.jpg)

# Conclusion

* The semantic meaning of activations of neurons is not meaningful since random directions in feature space present similar properties.
* Adversarial examples can be found for any neural network, they transfer across architectures trained with different hyperparameters and even different data sets.

