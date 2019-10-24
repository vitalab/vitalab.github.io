---
layout: review
title: "GSNN : The More You Know: Using Knowledge Graphs for Image Classification"
tags: deep-learning LSTM classification layers
author: "Pierre-Marc Jodoin"
cite:
    authors: "Kenneth Marino, Ruslan Salakhutdinov, Abhinav Gupta"
    title:   "The More You Know: Using Knowledge Graphs for Image Classification"
    venue:   "CVPR 2017"
pdf: "https://arxiv.org/pdf/1612.04844.pdf"
---

## Summary

This paper investigates the use of knowledge graphs and shows that using this knowledge improves performance
on image classification.  The propose a Graph Search Neural Network (GSNN) that reasons
about different types of relationships and concepts that are used for image classification.

![](/article/images/GSNN/sc01.jpg)

## Proposed network

The goal of the system is to learn an adjacency matrix as well as the state of every node.  The adjacency matrix defines which visual nodes are connected and the state if the node is present in the image.  This is learned via a **propagation network**.  

![](/article/images/GSNN/sc02.jpg)

However, since learning the entire graph all at once is time expensive, they start by propagating information from visual nodes detected by Faster R-CNN.
They then add the nodes adjacent to the initial nodes to the active set and propagate the beliefs about the initial
nodes to all of the adjacent nodes. After the first time step, we need a way of deciding which nodes to expand next. This is done with an **importance network**

At the final time step T, they compute the per-node-output and re-order and zero-pad the
outputs into the final **classification net**.  

In summary, the system involves 3 networks namely the **propagation net**, the **importance
net**, and the **output net**.

![](/article/images/GSNN/sc05.jpg)


## Results

The method gets state of the art results on the COCO and the visual genome datasets.

![](/article/images/GSNN/sc03.jpg)

![](/article/images/GSNN/sc04.jpg)

