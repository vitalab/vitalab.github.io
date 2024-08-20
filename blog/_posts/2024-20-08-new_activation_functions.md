---
layout: review
title:  "Some recent activation functions mimicking ReLU"
tags:   deep-learning machine-learning
author: Pierre-Marc Jodoin
---

In this document, I want to underline the links the following activation functions: ReLU, ELU, GELU, GLU, ReGLU, GEGLU, and SwiGLU

Activation functions play a critical role in deep learning, influencing how models learn and generalize. Below is a description of the relationships between several important activation functions: ReLU, ELU, GELU, GLU, ReGLU, GEGLU, and SwiGLU.

## 1. ReLU (Rectified Linear Unit)

**ReLU** is one of the most commonly used activation functions in neural networks. It is defined as:

$$
\text{ReLU}(x) = \max(0, x)
$$

If $$x$$ comes from a previous layer, we have $$x=Wx^-+b$$ where $$x^-$$ is the output of the layer before.

## 2. SiLU (Sigmoid Linear Unit)

**SiLU** is a simple approximation of ReLU but without any discontinuity of the first derivative:

$$
\text{SiLU}(x) = x \cdot \sigma(x)
$$

where $$\sigma(x)$$ is the sigmoid function. 

## 3. Swish

**Swish** is a simple generalization of SiLU

$$
\text{Swish}(x) = x\sigma(\beta x)
$$

where $$\beta$$ is learnable.  When  $$\beta=1$$, Swish becomes SiLU. 

## 3. GLU (Gated Linear Unit)

**GLU** introduces a gating mechanism where the output of a linear transformation is modulated by a gate:

$$
\text{GLU}(x) = x_1 \cdot \sigma(x_2)
$$

where $$ x_1 = Wx^-+b$$ and $$ x_2 = Vx^-+c $$ are different linear transformations of the input $$x$$.

## 5. ReGLU (Rectified Gated Linear Unit)

**ReGLU** is a variant of GLU that uses ReLU instead of the sigmoid function as the gating mechanism:

$$
\text{ReGLU}(x) = x_1 \cdot \text{ReLU}(x_2)
$$

## 7. SwiGLU (Swish-Gated Linear Unit)

**SwiGLU** replaces the gating mechanism in GLU with the Swish activation function:

$$
\text{SwiGLU}(x) = x_1 \cdot \text{Swish}(x_2)
$$



