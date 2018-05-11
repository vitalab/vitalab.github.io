---
layout: review
title:  "Select, Attend, and Transfer: Light, Learnable Skip Connections"
tags:   deep-learning, MRI, segmentation, 3D,
author: Charles Authier
pdf:    https://arxiv.org/pdf/1804.05181v3
cite:
  authors: "Saeid Asgari Taghanaki, Aicha Bentaieb, Anmol Sharma, S. Kevin Zhou, Yefeng Zheng, Bogdan Georgescu, Puneet Sharma, Sasa Grbic, Zhoubing Xu, Dorin Comaniciu, Ghassan Hamarneh"
  title:   "Select, Attend, and Transfer: Light, Learnable Skip Connections"
  venue:   "Arxiv 2018"
---


They propose a light, learnable skip connections which learn to select the most discriminative channels and then attend to the most discriminative regions of the selected feature maps.
The skip connections output will be a unique feature map which reduces the memory usage, the network parameters to a high extent, and improving the segmentation accuracy. They claim that the proposed skip connections can outperform the traditional heavy skip connections in terms of segmentation accuracy, memory usage, and the number of network parameters.


### Segmentation Network
* 2D/3D U-net
* 2D/3D V-net
* The One Hundred Layers Tiramisu (DensNet)


### The Select-Attend-Transfer (SAT) gate
1. Select: re-weighting the channels of the input, using a learned weight vector with sparsity constraints, only those channels with non-zero weights are selected.
2. Attend: discovering the most salient spatial locations within the final feature map.
3. Transfer: transferring the output into layers via a skip connection.

![](/deep-learning/images/LLSC/SAT.png)

## Experiments
* original skip connections (ORG)
* skip connections, transfer only an attention map (AT)
* skip connections, transfer several soft selected channels (ST)
* skip connections, transfer only one attention map produced from soft selected channels (SAT)

*N is the total number of channels C before skip connection*

![](/deep-learning/images/LLSC/RSAT.png)

On the Tiramisu, they reach 2%(MRI) to 3%(Skin) for the accuracy compare to the original skip connections.

For the parameters reduction, it's between 7 and 30% of reduction depending on the network.

## Improvement
* **channels selection and attention**: fewer feature maps, less memory use, focus on spatial regions in the input.
* **consistent segmentation**: segmentation more consistent, smaller std than the original skip connections.
* **SAT in Densely connected network**: help preventing gradient vanishing, reduce memory usage in blocks.
