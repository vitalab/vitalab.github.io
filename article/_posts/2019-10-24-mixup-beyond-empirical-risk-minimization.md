---
layout: review
title: "Manifold mixup: Encouraging meaningful on-manifold interpolation as a regularizer"
tags: layers classification data-augmentation
author: "Philippe Poulin"
cite:
    authors: "Vikas Verma, Alex Lamb, Christopher Beckham, Aaron Courville, Ioannis Mitliagkis, and Yoshua Bengio"
    title:   "Manifold mixup: Encouraging meaningful on-manifold interpolation as a regularizer"
    venue:   "arXiv2018"
pdf: "https://arxiv.org/abs/1806.05236"
---


# Highlights

- Simple regularization method that encourages neural networks to predict less confidently on interpolations of hidden representations
- Smoother decision boundaries
- Learned representations with less directions of variance
- Better generalization than other competitive regularizers (e.g. dropout)
- Improved robustness to adversarial attacks

# Method

> Manifold mixup is based on [Input Mixup](https://arxiv.org/pdf/1710.09412.pdf), where pairs of inputs and targets are interpolated to create new data.

> "[...], mixup regularizes the neural network to favor simple linear behavior in-between training examples."

Manifold mixup is a simple data augmentation method, which consists of *interpolating* pairs of hidden activations of inputs and labels (one-hot encodings for classification)

**Procedure**:

1. Select a random layer in the network (may include the input layer)
2. Sample two minibatches of data, and run them through the network up to the selected layer
3. Perform *Input mixup* by sampling pairs of inputs/labels, and interpolating between them to build a "mixed minibatch"
4. Run the mixed minibatch through the rest of the network to produce the output
5. Compute the loss between the output and the "mixed label" (interpolation between the original labels)

- **Smoother decision boundaries**
![](/article/images/manifold-mixup/figure1.png)

- **Concentration of hidden states with regions of low confidence**
![](/article/images/manifold-mixup/figure2.png)

- **Flattening effect on the hidden states**
![](/article/images/manifold-mixup/figure3.png)



# Experiments


## Results

- **CIFAR-10 and CIFAR-100**
![](/article/images/manifold-mixup/table1.png)

- **SVHN**
![](/article/images/manifold-mixup/table2.png)

- **MNIST learned representations**
![](/article/images/manifold-mixup/figure5.png)

