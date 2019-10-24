---
layout: review
title:  "Learning both Weights and Connections for Efficient Neural Networks"
tags:   pruning-acceleration deep-learning CNN essentials network-pruning
author: Pierre-Marc Jodoin
pdf:    https://arxiv.org/pdf/1506.02626.pdf
cite:
  authors: "S.Han, J.Pool, J. Tran, W.J.Dally"
  title:   "Learning both Weights and Connections for Efficient Neural Networks"
  venue:   "NIPS 2015"
---

This paper proposes a network pruning method based on a three-step process.  As illustrated in Figure 2, the method begins by learning
the connectivity via normal network training. Unlike conventional training, however, it does not learn the final values of the weights, but rather learns which connections are important.  The second step is to prune the low-weight connections. All connections with weights below a threshold are removed from the network — converting a dense network into a sparse network, as shown in Figure 3. The final step retrains the network to learn the final weights for the remaining
sparse connections. This step is critical. If the pruned network is used without retraining, accuracy is significantly impacted

![](/article/images/pruning2015/sc01.jpg)

## Results

The method is both simple and has good compression rates as shown in Table 1.

![](/article/images/pruning2015/sc02.jpg)

They also show that the kind of regularization used can have an important impact on the accuracy.

![](/article/images/pruning2015/sc03.jpg)






