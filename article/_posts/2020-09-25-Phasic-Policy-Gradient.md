---
layout: review
title: "Phasic Policy Gradient"
tags: reinforcement
author: "Antoine Théberge"
cite:
    authors: "Karl Cobbe, Jacob Hilton, Oleg Klimov, John Schulman"
    title:   "Phasic Policy Gradient"
    venue:   "Arxiv"
pdf: "https://arxiv.org/abs/2009.04416"
---


# Highlights

- More sample-efficient actor-critic reinforcement learning algorithm 

# Introduction

Most policy gradient (PG) reinforcement learning (RL) algorithms use the Actor-Critic (AC) framework. In this context, two neural networks are trained in parallel: one being the Actor, aka the policy, which will output actions that are applied to the environment, the second network being the Critic, which will infer the value of the actions output by the actor. By using the training signal provided by the critic, the actor can learn more efficiently.

Whether or not the actor and the critic share parameters is usually a pretty big choice to make: If parameters are shared, features learned by one of the network can be reused by the other. However, it also means that both networks' objectives might interfere with eachother. The authors also argue that this forces the networks to be trained on the same data, and therefore impose the same level of sample reuse, which might be undesirable. On the other, having two seperate networks means that they cannot share learned features.

To try and have the best of both worlds, the authors propose the _Phasic Policy Gradient_ algorithm, where feature sharing is kept but the two networks training are decoupled.

# Methods

![](/article/images/phasic-pg/fig1.jpeg)

To decouple training while also enabling feature sharing, a novel actor-critic architecture is proposed where the actor and critic use separate networks, while also adding a critic head to the actor network. Figure 1 highlights the proposed architecture. 

To train the networks, the learning process is split into two phases: The policy phase and the auxiliary phase. During the policy phase, the actor is trained using the standard PPO[^1] clipped lost:

![](/article/images/phasic-pg/eq1.jpeg)

where $$r_t(\theta) = \frac{\pi_\theta(a_t{\mid}s_t)}{\pi_{\theta_{old}}(a_t{\mid}s_t)}$$. During the same phase, the critic is also trained using standard $$L_2$$ loss

![](/article/images/phasic-pg/eq2.jpeg)

where $$\hat{V}^{targ}_t$$ and $$\hat{A}_t$$ are computed with GAE[^2]. The _policy_ phase so far is on par with previous works. The novelty comes from the _auxiliary_ phase, where the policy is again optimized, but this time with the following joint loss:

![](/article/images/phasic-pg/eq3.jpeg)

which includes an auxiliary loss $$L^{aux}$$ component for the auxiliary critic head on the actor network, as well as a behavioral cloning loss component to preserve the original policy. $$\pi_{\theta_{old}}$$ is the policy right before the auxiliary phase begins.

$$L^{aux}$$ is again a $$L_2$$ loss

![](/article/images/phasic-pg/eq4.jpeg)

where $$\hat{V}^{targ}_t$$ are the targets computed during the policy phase and $$V_{\theta_\pi}$$ is the critic head shown in Figure 1.

The whole algorithm is shown below:

![](/article/images/phasic-pg/alg1.jpeg)

## Data

The algorithm was tested on the Procgen Benchmark suite[^3].

# Results

## Comparison to PPO

![](/article/images/phasic-pg/res1.jpeg)

We can see that the algorithm learns faster as well as better than PPO on all environments.

## Sample reuse

![](/article/images/phasic-pg/res2.jpeg)

Reusing the same samples for multiple training epochs for the policy does not seem to improve performance.

![](/article/images/phasic-pg/res3.jpeg)

> We find that training with additional auxiliary epochs is generally beneficial, with performance tapering off around 6 auxiliary epochs.

![](/article/images/phasic-pg/res4.jpeg)

> It is clear that performance suffers when we perform auxiliary phases too frequently. We conjecture that each auxiliary phase interferes with policy optimization, and that performing frequent auxiliary phases exacerbates this effect.

## Single network vs. multiple networks

![](/article/images/phasic-pg/res5.jpeg)

> As we can see, using PPG with this single shared network performs almost as well as PPG with a dual network architecture. We were initially concerned that the value function might be unable to train well during the policy phase with the detached gradient, but in practice this does not appear to be a major problem. We believe this is because the value function can still train from the full gradient during the auxiliary phase.

# Conclusions

> By mitigating interference between the policy and the value function while still maintaining the benefits of shared representations, PPG significantly improves sample efficiency on the challenging Procgen Benchmark. Moreover, PPG establishes a framework for optimizing arbitrary auxiliary losses alongside RL training in a stable manner

# Remarks

- Would have been nice to see results on the Mujoco or Atari suite

# References

[^1]: [Proximal Policy Optimization Algorithms](https://arxiv.org/abs/1707.06347)
[^2]: [Generalized Advantage Estimation](https://arxiv.org/abs/1506.02438)
[^3]: [Procgen Benchmark](https://openai.com/blog/procgen-benchmark/)

Code: [https://github.com/openai/phasic-policy-gradient](https://github.com/openai/phasic-policy-gradient)
