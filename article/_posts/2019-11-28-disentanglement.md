---
layout: review
title: "Artifact Disentanglement Network for Unsupervised Metal Artifact Reduction"
tags: autoencoder deep-learning adversarial
author: "Pierre-Marc Jodoin"
cite:
    authors: "Haofu Liao, Wei-An Lin, Jianbo Yuan, S. Kevin Zhou, and Jiebo Luo"
    title:   "Artifact Disentanglement Network forUnsupervised Metal Artifact Reduction"
    venue:   "MICCAI 2019"
pdf: "https://arxiv.org/abs/1906.01806.pdf"
---


# Highlights
* Unsupervised method for removing artifacts from medical images.  
* Unsupervised method for transferring artifacts from one image to another one.

# Method 

The proposed method starts from two sets of images : some with artifacts and others without.  Through a series of encoders and decoders, the system tries to learn the latent representation of 

* Artifacts
* Images behind the artifacts
* Images without any artifacts

Since the method is unsupervised, two discriminator networks are used to learn an adversarial  loss thus forcing the system to produce realistic images with and without artifacts.  The proposed system is illustrated in Fig.1.


![](/article/images/disentanglement/sc01.jpg)


As one can suspect, the overall loss is quite thick:


![](/article/images/disentanglement/sc07.jpg)

The first two terms are adversarial losses which tries to fool the discriminators by showing real and fake artifact-free images

![](/article/images/disentanglement/sc02.jpg)

as well as real and fake artifacted images.

![](/article/images/disentanglement/sc04.jpg)

The third term is a simple L1 loss (used to train an auto-encoder)

![](/article/images/disentanglement/sc03.jpg)

The fourth term is a cycle loss which is a L1 distance function between the input artifact-free image $$y$$ and the recontructed atifact-free image obtained after adding artifacts to $$y$$ 

![](/article/images/disentanglement/sc05.jpg)

The last term is an L1 loss to force the reconstructed images to be not too different from the input images

![](/article/images/disentanglement/sc06.jpg)

## Results

Results are quite impressive, on par with those obtained by supervised methods.

![](/article/images/disentanglement/sc08.jpg)

![](/article/images/disentanglement/sc10.jpg)




