---
layout: review
title: Simplifying Deep Temporal Difference Learning
date: 2025-04-07
reference: https://openreview.net/attachment?id=7IzeL0kflu&name=pdf
tags:
  - rl
  - TD learning
  - marl
author: Jeremi Levesque
cite:
  authors: Gallici, M., Fellows, M., Ellis, B., Pou, B., Masmitja, I., Foerster, J. N., & Martin, M.
  title: Simplifying Deep Temporal Difference Learning
  venue: ICLR 2025
pdf: https://arxiv.org/abs/2404.16130
---
> tl;dr
> - The authors propose PQN, a simplified deep online Q-Learning that uses very small replay buffers.
> - Normalization and parallelized sampling from vectorized environments stabilizes training without the need for huge replay buffers.
> - PQN is competitive with more complex methods such as Rainbow, PPO-RNN, QMix while being 50x faster than traditional DQN.

## Introduction
- Temporal difference (TD) methods can be simple and efficient, but are notably unstable when combining them with neural networks or off-policy sampling.
- All of the following methods were developed to stabilise TD whilst using deep neural networks (NN):
	- Replay buffer (batched learning)
	- Target networks
	- Trust region methods
	- DDQN
	- Maximum entropy methods (SAC)
	- Ensembling
- PPO seems to have been the de-facto method for a lot of scenarios, but its still very unstable and hard to configure with a lot of implementation details and tricks to efficiently implement.
- PPO has no provable convergence properties when used with NN.
![](/article/images/simplifying-td-learning/PQN-high-level.jpg)
## Context
### Temporal difference methods
- TD error:
$$\delta(\phi, \varsigma) = (r + \gamma Q_{\phi}(x') - Q_{\phi}(x))\nabla_{\phi} Q_{\phi}(x)$$
- TD parameter update:
$$\phi_{i+1} = \phi_i + \alpha_i \delta(\phi_i, \varsigma)$$
Where we have:  
	- The tuple $$x = (s_t, a_t)$$  
	- $$x \sim d^u$$, where $$d^u$$ generally is an ergodic Markov chain or a replay buffer (offline case)
	- $$\varsigma$$ is a tuple $$\varsigma = (x, r, x') = (s_t, a_t, r, s_{t+1}, a_{t+1})$$ 
	- $$\phi$$ the parameters of the Q-network.
### Vectorized environments
- Parallelization of interaction using vectorised environments with multithreading is standard to speed up training.
- More recent GPU-based frameworks (e.g. IsaacGym, Craftax, etc.) are vectorized by using batched tensors which allows the agent to interact with thousands of environments.
- Allows compilation of a single 
- Not possible to do with DQN because of:
	1. Replay buffer in memory is practically impossible since it would take most of the VRAM.
	2. Convergence of off-policy methods usually have a low update-to-data (UTD) ratio (i.e. UTD of 1 for traditional DQN).
- Usually parallelization of Q-learning looks like:
	- 1 process that continuously trains the agent in a separate process whilst another is very quickly sampling new transitions.

### Analysis of regularized TD

#### LayerNorm and BatchNorm TD
**BatchNorm** alone doesn't stabilize TD learning, it can even degrade learning in some cases. Only in the case of CrossQ while having multiple tricks (double Q-learning, BatchRenorm) can it stabilize training. However, it seems like BatchNorm can improve results if *applied early in the network*.

**LayerNorm** + L2 regularized TD can stabilise TD by mitigating effects of nonlinearity and off-policy sampling as demonstrated by their extensive theoretical analysis in the paper. The authors suggest to start with LayerNorm and L2 regularisation as a strong baseline to stabilize TD algorithms.

Their analysis demonstrate that L2 regularization should only be used sparingly; only when the LayerNorm alone cannot stabilize the environment and initially **only over the final layer weights**. However, using only LayerNorm without L2 regularization *cannot completely stabilize TD learning for all domains*.
### Parallelized Q-Learning
- **No target network.**
- **Q-Networks regularized** (with LayerNorm preferably)
- *n*-step returns ($$\lambda$$-returns)
---
#### $$\lambda$$-returns
$$\pi_{Explore}$$ ($$\varepsilon$$-greedy policy) rolled out for a small trajectory of size $$T$$. $$\tau = (s_i, a_i, r_i, s_{t+1} \cdots s_{i+T})$$ after which we start computing the returns as such:

1. (Last return) Start with $$R^{\lambda}_{i+T} = \max_{a'} Q_{\theta}(s_{i+T}, a')$$
2. (Target returns) Compute target recursively: $$R^{\lambda}_t = r_t + \gamma \left[ \lambda R^{\lambda}_{t+1} + (1 - \lambda) \max_{a'} Q_{\theta} (s_{t+1}, a') \right]$$
3. (Terminal state) If $$s_t$$ is a terminal state, replace the target with $$R^{\lambda}_t = r_t$$

Only to compute $$\lambda$$-returns, a small replay buffer containing only the transitions tuples for each agent of the length of the trajectory is needed, which is much smaller than the usual buffer of length 1M for each agent since $$T << Length_{buffer}$$.

Special case of $$\lambda = 0$$ and $$T = 1$$ is equivalent to traditional Q-learning (update at each transition).

---
#### PQN Algorithm

![](/article/images/simplifying-td-learning/PQN-Algorithm.jpg)

Similarily to PPO, for improved sample-efficiency, PQN divides the collected experiences into multiple minibatches while updating on them multiple times within a few epochs.

PQN is an off-policy algorithm since it uses two different policies:
1. $$\varepsilon$$-greedy policy for the current timestep
	1. $$\varepsilon = 1$$ at the start of training. This implies that we're optimizing value functions for a fully random policy, and this requires normalization to avoid training instability as they proved in the paper.
2. Current policy for the next step

![](/article/images/simplifying-td-learning/PQN-advantages-table.jpg)

Table 1 summarizes the advantages of this algorithm. The closest algorithm would be PPO in terms of these characteristics, but it requires numerous interacting implementation details and having more hyperparameters to tune, making it harder to use.

**Multi-agent learning version**
The algorithm can also be adapted to cooperative multi-agent scenarios by adopting *Value Network Decomposition Networks* (VDN). In other words, this optimizes the joined action-value function as a sum of the single agents action-values.

---
#### Benefits of online q-learning with vectorized environments

1. Parallelized nature can help exploration since the natural stochasticity in the dynamics means even a greedy policy will explore several different states in parallel.
2. Taking multiple actions in multiple states, enables PQN's sampling distribution to be a good approximation of the true stationary distribution under the current policy.

![](/article/images/simplifying-td-learning/sampling-regimes.jpg)

As illustrated in Figure 3, sampling from DQN's replay buffer is kind of equivalent of sampling from an average of *older* stationary distributions under varying policies.

---
## Experiments

#### Atari
![](/article/images/simplifying-td-learning/Atari-Results.jpg)

#### Baird's Counter and others
![](/article/images/simplifying-td-learning/MARL-results.jpg)
- Baird's Counter is an environment designed to be provably divergent. PQN with LayerNorm and L2 loss diverges much less than its unnormalized counterpart.
- Craftax is an environment where the agent has to solve multiple tasks before completion and PQN with an RNN is more sample efficient than PPO with an RNN and performs slightly better, while the two methods take similar time to train.
- Smax, Overcooked and Hanabi are three multi-agent environments. PQN-VDN outperforms or is more sample efficient than all evaluated algorithms on those datasets while not requiring a huge replay buffer.
#### Ablations

**Input Normalization**. BatchNorm mostly useful as input normalization before the first layer. Adding CrossQ's tricks worsens the performance. Instead of using BatchNorm, which can sometimes hurt the performance, adding LayerNorm within the whole network seems to have the same effect while being more stable.

**Varying $$\lambda$$**. Experiments show that $$\lambda = 0.65$$ performs significantly better, demonstrating that $$\lambda$$-returns are an important design choice.

**Replay Buffer**: Figure 6d) demonstrate that PQN reaches the same performance in 6x quicker than if it was using huge replay buffers to store 1M transitions on GPU memory.

**Number of environments**: PQN can learn even with very few environments, but it is strongly encouraged, as shown in Figure 6e), to use many more environments as it is much quicker.
![](/article/images/simplifying-td-learning/Ablations.jpg)