---
layout: review
title: "Learning Shape Priors for Single-View 3D Completion and Reconstruction"
tags: deep-learning 3D
author: Frédéric Branchaud-Charron
cite:
    authors: "Jiajun Wu, Chengkai Zhang, Xiuming Zhang, Zhoutong Zhang, William T. Freeman, Joshua B. Tenenbaum"
    title:   "Learning Shape Priors for Single-View 3D Completion and Reconstruction"
    venue:   "Arxiv"
pdf: "https://arxiv.org/pdf/1809.05068v1.pdf"
---

Current methods for 3D objects reconstruction often generate unnatural objects. The authors propose to train the network to only generates natural objects.

![](/article/images/3d-completion/fig2.jpg)

The task is the following, from a 2D image, the model generates the full 3D object. The output is a 3D cube and is learned by binary crossentropy.

![](/article/images/3d-completion/fig3.jpg)

The metrics used are the IoU between the volume generated and the groundtruth volume or the Chamfer Distance, which is the distance between a point and its closest groundtruth point. On most task, they are even better than methods that require a mask and are overall better than all previous methods.

To enforce the *naturalness* of the object, they train a WGAN that will classify whether an object is natural or not.

![](/article/images/3d-completion/fig5.jpg)
