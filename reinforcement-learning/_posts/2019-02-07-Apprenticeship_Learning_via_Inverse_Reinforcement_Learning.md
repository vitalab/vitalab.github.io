---
layout: review
title: "Apprenticeship Learning via Inverse Reinforcement Learning"
tags: reinforcement essential
author: "Antoine Théberge"
cite:
    authors: "Pieter Abbeel, Andrew Y. Ng"
    title:   "Apprenticeship Learning via Inverse Reinforcement Learning"
    venue:   "ICML 2004"
pdf: "https://ai.stanford.edu/~ang/papers/icml04-apprentice.pdf"
---

## Introduction

Consider the task of highway driving. When driving, we typically trade off many different desiderata, such as maintaining safe following distance, keeping away from the curb, staying far from any pedestrians, maintaining a reasonable speed, and so on . . . . To specify a reward function for the driving task, we would have to assign a set of weights stating exactly how we would like to trade off these different factors. Despite being able to drive well, most humans could not confidently specify a good reward function for the task of "drining well".

When teaching a young adult to drive, rather than telling them what the reward function is, it is much easier and more natural to demonstrate driving to them, and have them learn from the demonstration.

Given that the entire field of reinforcement learning is founded on the presupposition that the reward function, rather than the policy or the value function, is the most succinct, robust, and transferable definition of the task, it seems natural to consider an approach to apprenticeship learning whereby the reward function is learned.

The problem of deriving a reward function from observed behavior is referred to as inverse reinforcement learning. The authors then try to teach a agent to build a policy that performs well with respect to the *unknown* reward function.

## Algorithm

The policy $$\tilde \pi $$ that follows the expert's policy $$ \pi_E$$ is found by:

![](/reinforcement-learning/images/al-irl/algo1.png)


whereas $$\mu$$ is the expectation of the feature vector ($$\phi$$, basically the model) of the policy at any time-step, $$w$$ is the desiredata of your feature vector, $$\epsilon$$ is the margin of error between the expert's policy and the agent's. Step 4 supposes that the optimal policy for the MDP exists.

Step 2 can be re-written as

![](/reinforcement-learning/images/al-irl/algo2.png)

which is similar to finding the maximum margin hyperplane seperating two sets of points in an SVM, where $$\mu_E$$ has the label $$1$$ and $$\{\mu(\pi^{(j)}): j = 0..(i-1)\}$$, the found policies, have the label $$-1$$

Termination of the algorithm then provides

![](/reinforcement-learning/images/al-irl/eq13.png)

which means there is atleast one policy found whose performance is atleast as good as the expert's performance minus $$\epsilon$$, where $$w$$ was found using a SVM or QP solver.

If access to a SVM/QP is impossible or undesirable

TODO

## Results

In our first set of experiments, the authors used 128 by 128 gridworlds with multiple/sparse rewards. The reward is not known to the algorithm, but we can sample trajectories from an expert’s (optimal) policy. The agent has four actions to try to move in each of the four compass directions, but with 30% chance an action fails and results in a random move. The grid is divided into non-overlapping regions of 16 by 16 cells; the authors call these 16x16 regions “macrocells.” A small number of the resulting 64 macrocells have positive rewards. For each value of $$i = 1, . . . , 64$$, there is one feature $$\phi_i(s)$$ indicating whether that state $$s$$ is in macrocell $$i$$. In this case, the expert policy is the optimal policy according to the grid layout.

![](/reinforcement-learning/images/al-irl/res1.png)
