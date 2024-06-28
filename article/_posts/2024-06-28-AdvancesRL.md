---
layout: review
title: "Advances in model-free reinforcement learning: REDQ, DroQ, CrossQ."
tags: reinforcement
author: "Antoine Théberge"
cite:
    authors: "Xinyue Chen, Che Wang, Zijian Zhou, Keith Ross"
    title:   "Randomized Ensembled Double Q-Learning: Learning Fast Without a Model"
    venue:   "ICLR 2021"
pdf: ""
---


# Highlights
- SAC is the baseline model-free RL algorithm since 2018
- REDQ improves of SAC by using an ensemble of critics and a UTD ratio >> 1
- DroQ improves on REDQ to use a smaller ensemble of critics, includes dropout
- CrossQ improves on DroQ to use a single critic, no target network and includes batch norm


# Introduction

Since its proposal in 2018, Soft Actor Critic (SAC) algorithms[^1][^2] have become the standard for online model-free reinforcement learning (RL). It's "maximum-entropy" framework proved very useful to balance exploration and exploitation while being very simple to implement, making use of the expressivity of Q functions instead value functions like PPO[^3], for example. 

Through the years, some improvements over SAC have been suggested, mostly in the hope of improving the data efficiency of learning agents. 

## Soft-Actor Critic

SAC presumes that there is more than one optimal solution to a given problem and that therefore, we would like to prevent the optimal policy from converging to a single one. Moreover, a policy with a high entropy will explore more and may prevent it from converging to a bad policy early on.

To do so, the standard RL objective is modified so as to become:

$$ \pi^* = \arg\max_{\pi} \mathbb{E}_{(s,a)~\sim\pi)} \big[\sum_{t=0}^\infty \gamma^t r(s_t, a_t) + \alpha \mathbb{H}(\pi(\cdot | s_t))\big]  $$

The Q-function becomes

$$ Q^\pi(s,a) = \mathbb{E}_{(s,a)~\sim\pi)} \big[\sum_{t=0}^\infty \gamma^t r(s_t, a_t) + \alpha \sum_{t=1}^\infty \gamma^t \mathbb{H}(\pi( \cdot | s_t)) \big | s_0 = s, a_0 = a \big], $$

therefore giving an implicit reward bonus proportional to the policy's entropy at each timestep. 

SAC uses two critics to fight overestimation by using the minimum of the two predictions. The critic loss can be formulated as

$$ L(\theta_i, \mathcal{D}) = \mathbb{E}_{(s,a,s',d)\sim\mathcal{D}} [(Q_{\theta_i}(s,a) - y(s,a,s',d))^2] $$

with

$$y(r,s,a,s',d) = r(s,a) + \gamma (1-d) \big[\min_{j=1,2} Q_{\bar{\theta_j}}(s',\bar{a}', s') - \alpha \log \pi(\bar{a}' | s')\big], \; \bar{a}' \sim \pi(\cdot | s'),$$

and $$Q_\bar{\theta}$$ the target critics.



## REDQ

After SAC, a few algorithms have brought forth the concept of Update to Data ratio (UTD). Essentially, SAC and other off-policy algorithms typically acquire a transition, put it in the replay buffer, sample it randomly, update the agent and then acquire another transition. This amounts to a UTD of 1. A few algorithms, mostly model-based RL, argue this is inneficient and agents can benefit from sampling the buffer and updating the agent multiple times (twice, ten or fourty times) between transition acquisitions, speeding up learning.

Randomized Ensembled Double Q-Learning[^4] (REDQ) improves upon SAC by employing a UTD around 20. However, this alone would lead to a high bias in the Q function and a high variance in the bias as well. The authors then propose to include an ensemble of critics (~10) but only use a random sample when performing the update (~2).

![](/article/images/sac_improvements/table2_3.jpeg)

## DroQ

## CrossQ


# References

[^1]: Haarnoja, T., Zhou, A., Abbeel, P., & Levine, S. (2018, July). Soft actor-critic: Off-policy maximum entropy deep reinforcement learning with a stochastic actor. In International conference on machine learning (pp. 1861-1870). PMLR.
[^2]: Haarnoja, T., Zhou, A., Hartikainen, K., Tucker, G., Ha, S., Tan, J., ... & Levine, S. (2018). Soft actor-critic algorithms and applications. arXiv preprint arXiv:1812.05905.
[^3]: Schulman, J., Wolski, F., Dhariwal, P., Radford, A., & Klimov, O. (2017). Proximal policy optimization algorithms. arXiv preprint arXiv:1707.06347.
