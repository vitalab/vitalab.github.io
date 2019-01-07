---
layout: review
title: "Tractography using reinforcement learning and adaptive-expanding graphs"
tags: reinforcement tractography
author: "Antoine Théberge"
cite:
    authors: "Tingyi Wanyan, Lantao Liu, Eleftherios Garyfallidis"
    title:   "Tractography using reinforcement learning and adaptive-expanding graphs"
    venue:   "ISBI 2018"
---

## Introduction

Currently, three types of tractography algorithm exist: deterministic, probabilistic and global algoritms. The authors propose a novel approach based on reinforcement-learning.

## Method

The authors used the ISMRM 2015 challenge dataset which provided a starting and goal point for tractography. They then used a graph to represent their exploration and experiences. Each node represent a state in their search and has a value function, updated via Temporal-Difference (TD) learning:

$$ V(s_t) \leftarrow V(s_t) + \alpha[R_{t+1} + \gamma V(s_{t+1}) - V(s_t)] $$

where $$V(s_t)$$ is the value function, the sum of all expected rewards at this node, $$\alpha$$ is the learning rate, $$\gamma$$ a discount factor and $$R_{t+1}$$ is the reward at the next time step. It is worth noting that the value function is only updated when a valid path (ed. the definition of a valid path is not specified, probably a path that goes near or to the end goal) is found to prevent penalizing invalid paths, which are still useful for exploration. In the end, optimal tracts are determined by their total reward (ed. reward function not described).

## Results

(See poster, table 1 for results)

We can see that the RL algorithm performs much better at finding valid tracts than a deterministic algorithm (EuDX, which is old and not used very much anymore).  However, we do not know many invalid tracts the RL algorithm has found. After all it might just brute-force it. It would have been much more informative to display precision, recall or any other metric than solely the true-positives rate. Also, to reiterate, they had the massive advantage of having an end goal, which most definitely helped them design their reward.

