---
layout: review
title: "What Matters In On-Policy Reinforcement Learning? A Large-Scale Empirical Study"
tags: reinforcement deep-learning
author: "Antoine Théberge"
cite:
    authors: "Marcin Andrychowicz, Anton Raichuk, Piotr Stańczyk, Manu Orsini, Sertan Girgin, Raphael Marinier, Léonard Hussenot, Matthieu Geist, Olivier Pietquin, Marcin Michalski, Sylvain Gelly, Olivier Bachem"
    title:   "What Matters In On-Policy Reinforcement Learning? A Large-Scale Empirical Study"
    venue:   "Arxiv"
pdf: "https://arxiv.org/pdf/2006.05990.pdf"
---


# Highlights

- A large scale empirical study on design choices for Reinforcement Learning (RL) algorithms
- Light recommendations are available from this study

# Introduction

> Deep reinforcement learning (RL) has seen increased interest in recent years due to its ability to have neural-network-based agents learn to act in environments through interactions. For continuous control tasks, on-policy algorithms such as REINFORCE, TRPO, A3C, PPO and off-policy algorithms such as DDPG and SAC have enabled successful applications such as quadrupedal locomotion, self-driving or dexterous in-hand manipulation.

However, many of these algorithms employ high and low-level choices that may not be mentioned in their respective papers. Engstrom et al.[^1] showed that the original PPO paper failed to mention several key design choices that actually make up most of the improvements PPO had over prior methods. Code-level and algorithmic level hidden implementation details severely hinder reproducibility and slow down research in a field where reproducibility is already hard to achieve.[^2] 

# Methods

The authors ran 250 000 experiments to investigate 68 implementation details separated in 8 different groups of choices: Policy Losses, Networks architecture, Normalization and clipping, Advantage Estimation, Training setup, Timesteps handling, Optimizers, and Regularization. For each group, the authors selected which choices might interact the most with each other, and left the remaining choices with default parameters that give competitive results.

Performance was then computed by training models with randomly selected values over three different random seeds and periodically evaluating the models over 100 runs, then averaging the returns over the random seeds.

The table below lists some of the available choices that had a default value

![](/article/images/WhatMatters/table1.jpeg)

Choices not listed were experimented upon in their group but were not general enough to be considered a part of the default configuration.

## Data

The authors evaluated the performance of the models over five popular robotic control tasks from OpenAI Gym: Hopper-v1, Walker2d-v1, HalfCheetah-v1, Ant-v1, and Humanoid-v1.

# Results

For each of the eight choice groups, the authors report their interpretation of the results as well as a light recommendation:

## Policy losses

*Study*:

Which algorithm should be used as well as their hyperparameters

*Result*:
> Use the PPO policy loss. Start with the clipping threshold set to 0.25 but also try lower and higher values if possible.

## Networks architecture

*Study*:

Width and height of policy and value networks, whether they should share weights or not, weight scaling, activations as well as standard deviation and scaling of actions

*Results*:

> Initialize the last policy layer with 100× smaller weights. Use softplus to transform network output into action standard deviation and add a (negative) offset to its input to decrease the initial standard deviation of actions. Tune this offset if possible. Use tanh both as the activation function (if the networks are not too deep) and to transform the samples from the normal distribution to the bounded action space. Use a wide value MLP (no layers shared with the policy) but tune the policy width (it might need to be narrower than the value MLP).

## Normalization and clipping

*Study*:

> Observation normalization, value function normalization, per-minibatch advantage normalization, as well as gradient and observation clipping

*Results*:

> Always use observation normalization and check if value function normalization improves performance. Gradient clipping might slightly help but is of secondary importance.

## Advantage Estimation

*Study*:

The authors compare several advantage estimators (N-Step, GAE, V-Trace), their hyperparameters, PPO-style value-function clipping, usage of Huber Loss as well as the number of parallel environments ran

*Results*:

> Use GAE with $$\lambda$$ = 0.9 but neither Huber loss nor PPO-style value loss clipping

## Training setup

*Study*:

> Number of parallel environments used (C1), the number of transitions gathered in each iteration, the number of passes over the data, minibatch size and how the data is split into minibatches

*Results*:

> Go over experience multiple times. Shuffle individual transitions before assigning them to minibatches and recompute advantages once per data pass. For faster wall-clock time training use many parallel environments and increase the batch size. Tune the number of transitions in each iteration if possible.

## Timesteps handling 

*Study*:

> Discount factor, frame skip and how episode termination due to timestep limits are handled

*Results*:

> Discount factor $$\gamma$$ is one of the most important hyperparameters and should be tuned per environment (start with $$\gamma$$ = 0.99)

## Optimizers

*Study*:

Adam vs RSMProp, their hyperparameters as well as learning rate decay

*Results*:

> Use Adam optimizer with momentum $$\beta 1$$ = 0.9 and a tuned learning rate (0.0003 is a safe default). Linearly decaying the learning rate may slightly improve performance but is of secondary importance.

## Regularization

*Study*:

> We investigate different policy regularizers, which can have either the form of a penalty, (e.g. bonus for higher entropy) or a soft constraint (e.g. entropy should not be lower than some threshold) which is enforced with a Lagrange multiplier. In particular, we consider the following regularization terms: entropy, the Kullback–Leibler divergence (KL) between a reference $$N(0,1)$$ action distribution and the current policy and the KL divergence and reverse KL divergence between the current policy and the behavioral one as well as the “decoupled” KL divergence.

*Results*:

None.

# Conclusions

Many implementation details are available for a user wanting to implement their favorite RL algorithm. This paper provides some insight as to which should be chosen and how to achieve good performance.

# Remarks
- A reader of this review wanting to follow these recommendations is STRONGLY encouraged to go read the actual paper before making decisions based on this review.
- The paper is only 8 pages long but comes with 40 pages of appendix detailing the implementation details and experiment design
- See also: [The 32 Implementation Details of Proximal Policy Optimization (PPO) Algorithm](https://costa.sh/blog-the-32-implementation-details-of-ppo.html)
- This is only for on-policy algorithms, but off-policy algorithms also suffer from similar problems. Recurrent RL is also very much obscure to this day.

# References

[^1]: See [https://vitalab.github.io/article/2020/01/14/Implementation_Matters.html](https://vitalab.github.io/article/2020/01/14/Implementation_Matters.html) for more info

[^2]: Joelle Pineau: Reproducibility, Reusability, and Robustness in Deep Reinforcement Learning ICLR 2018, https://www.youtube.com/watch?v=Vh4H0gOwdIg
