---
layout: review
title:  "Low-Shot Learning from Imaginary Data"
tags:   deep-learning few-shot-learning GAN
author: Frédéric Branchaud-Charron
pdf:    https://arxiv.org/pdf/1801.05401.pdf
cite:
  authors: "Yu-Xiong Wang, Ross Girshick, Martial Hebert, Bharath Hariharan"
  title:   "Low-Shot Learning from Imaginary Data"
  venue:   "CVPR 2018"
---

This paper adapts GANs for low-shot learning. As we see in fig. 2, from the few samples they have, they use a pretrained generator to augment the dataset and they use standard methods on the augmented dataset (siamese networks, etc). They do not show any generated samples. They also use a modified version of softmax with a prior probability which boosts probabilities of the "novel" classes. Those classes are only seen at test time and the network was not trained on those.

![](/article/images/fewshotgan/fig2.jpg)

In Table 1, we see that the top-5 accuracy is highly impacted by the new training scheme when $$n$$ is low.
![](/article/images/fewshotgan/table1.jpg)

Finally, they do show that the generated samples are closer to the real distribution than using prototypes.

![](/article/images/fewshotgan/fig7.jpg)
