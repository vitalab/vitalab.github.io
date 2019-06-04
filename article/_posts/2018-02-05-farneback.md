---
layout: review
title:  "Two-frame motion estimation based on polynomial expansion"
tags:   machine-learning optical-flow
author: Frédéric Branchaud-Charron
pdf: http://www.ida.liu.se/ext/WITAS-ev/Computer_Vision_Technologies/Papers/scia03_farneback.pdf
cite:
  authors: "Farneback G."
  title:   "Two-frame motion estimation based on polynomial expansion"
  venue:   "Scandinavian conference on Image analysis (pp. 363-370). Springer, Berlin, Heidelberg, 2002"
---

In this work, the author wants to estimate the displacement field from two frames while compensating for the background motion.

To achieve this, each pixel's neighborhood is approximated by a polynomial $$f(x) = x^T Ax + b^T x + c$$, where $$A$$ is a symmetric matrix, $$b$$ a vector, $$c$$ a scalar and $$x$$ is coordinate.

These coefficients are estimated by a least squares fit. (*Note*: done by a separable convolution in practice.)

From the first and second images, they create $$A_1$$ and $$A_2$$ and calculate the mean to get a new matrix $$A$$.

They also introduce $$\delta b = - \frac{1}{2}(b_2 (x) - b_1 (x))$$.
The problem is then to solve $$A(x)d(x) = \delta b(x)$$ where $$d(x)$$ is the displacement field.

The result from this equation is too noisy. In consequence, the actual $$d(x)$$ is calculated from a weighted average of all displacement fields from the neighborhood.


### Adding an a priori

They add an a priori $$\bar d (x)$$, we only need to add it to the $$\delta b(x)$$ estimation.

$$\delta b = - \frac{1}{2}(b_2 (\bar x) - b_1 (x)) + A(x)\bar d (x)$$ where $$ \bar x = x + \bar d (x) $$.

As we can see, the method can be iterative and process multiple frames in a sequence.


### Results
Using a $$39x39, N(0,6)$$ gaussian weighting function and a $$11 \times 11, N(0,1.5)$$ gaussian for the polynomial expansion, the author shows great results on the Yosemite dataset.

* 1.58 average error from Mémin & Perez
* 1.40 average error for Farneback

The method doesn't work well for huge displacements (as we can see in low frame-rate cameras).
